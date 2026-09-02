//Ex6\src\main\java\com\ajt 
package com.ajt; 
import java.io.IOException; 
import java.util.Collections; 
import java.util.HashSet; 
import java.util.Set; 
import jakarta.websocket.OnClose; 
import jakarta.websocket.OnError; 
import jakarta.websocket.OnMessage; 
import jakarta.websocket.OnOpen; 
import jakarta.websocket.Session; 
import jakarta.websocket.server.ServerEndpoint; 
@ServerEndpoint("/WS") 
public class ChatServer { 
    private static Set<Session> clients = 
            Collections.synchronizedSet(new HashSet<>()); 
    @OnOpen 
    public void onOpen(Session session) { 
        clients.add(session); 
    } 
    @OnMessage 
    public void onMessage(String message, Session session) 
            throws IOException { 
        synchronized (clients) { 
            for (Session client : clients) { 
                if (client.isOpen()) { 
                    client.getBasicRemote().sendText(message); 
                } 
            } 
        } 
    } 
    @OnClose 
    public void onClose(Session session) { 
        clients.remove(session); 
    } 
    @OnError 
    public void onError(Session session, Throwable error) { 
        error.printStackTrace(); 
    } 
}
