package Socket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import Start.Model.Users;
import Start.Service.UserService;

 @ServerEndpoint(value = "/server1")
public class MyServerEndpoint {
	 UserService userService = new UserService();
	static Set<Object> users = Collections.synchronizedSet(new HashSet<>());
	  @OnOpen
	  public void handleOpen(Session session) throws IOException {
	    users.add(session);
	  }
	  @OnMessage
	  public void handleMessage(String message, Session userSession) throws IOException {
			String username = (String) userSession.getUserProperties().get("username");
			if (username == null) {
				userSession.getUserProperties().put("username", message);
				sendListUserOnline();
			} else {
				String friend ="";
				if(message.startsWith("LoadMess@@")) {
					friend=message.replace("LoadMess@@", "");
					String messageFriends = userService.LoadMess(username,friend);
					userSession.getBasicRemote().sendText("loadMess"+messageFriends);
				}
				else {
					if(message.startsWith("mess@@")) {
							String[] Messages=message.replace("mess@@", "").split("@@");
							friend = Messages[0];
							System.out.println(Messages[0]);
							String content = Messages[1];
							if(userService.SendMess(username,friend,content)) {
								userSession.getBasicRemote().sendText("mess@@"+username+"@@"+content);
								for (Object session : users) {
									if((((Session) session).getUserProperties().get("username").equals(friend))) {
										((Session) session).getBasicRemote().sendText("addmess@@"+username + "@@" + content);
									}
								}
						
						}
						else {
							userSession.getBasicRemote().sendText("erorMess@@");
						}
					}
					else {
						if(message.startsWith("findFriend@@")) {
							System.out.println("findFriend");
							String name=message.replace("findFriend@@", "");
							System.out.println(name);
							String listFind = userService.FindFriend(name);
							System.out.println(listFind);
							if(listFind.equals("")) {
								userSession.getBasicRemote().sendText("findfriend@@null");
							}
							else {
								userSession.getBasicRemote().sendText("findfriend@@"+listFind);
							}
							
						}
						else {
							if(message.startsWith("addFriend@@")) {
								System.out.println("addFriend");
								String name=message.replace("addFriend@@", "");
								System.out.println(name);
								if(userService.addFriend(username,name)) {
									userSession.getBasicRemote().sendText("addFriend@@ok");
								}
								else {
									userSession.getBasicRemote().sendText("addFriend@@lost");
								}
							}
							else {
								if(message.startsWith("Unfriend@@")) {
									System.out.println("Unfriend");
									String name=message.replace("Unfriend@@", "");
									System.out.println(name);
									userService.Unfriend(username,name);
								}
							}
						}
					}
				}
				for (Object session : users) {
					if((((Session) session).getUserProperties().get("username").equals(friend))) {
						((Session) session).getBasicRemote().sendText(username + ": " + message);
					}
				}
			}
	  }
	  public void sendListUserOnline() throws IOException {
	    for (Object session : users) {
	      ((Session) session).getBasicRemote().sendText(buildListUser());
	    }
	  }
	  public String buildListUser() {
	    StringBuffer listUser = new StringBuffer("list_user");
	    for (Object session : users) {
	      listUser.append(((Session) session).getUserProperties().get("username") + "\n");
	    }
	    System.out.println(listUser.toString());
	    return listUser.toString();
	  }
	  @OnClose
	  public void handleClose(Session session) throws IOException {
	    users.remove(session);
	    sendListUserOnline();
	  }
	  @OnError
	  public void handleError(Throwable t) {
	    t.printStackTrace();
	  }

}
