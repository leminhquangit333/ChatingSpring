		var websocket;
		document.getElementById('hide').style.display = "none";
		websocket = new WebSocket("ws://localhost:8000/ChattingSpring/server1");
		websocket.onopen = function(message) {
			console.log("opennn");
			processOpen(message);
		};
		websocket.onmessage = function(message) {
			processMessage(message);
		};
		websocket.onclose = function(message) {
			processClose(message);
		};
		websocket.onerror = function(message) {
			processError(message);
		};

		function disconnect() {
			websocket.close();
		}

		function processOpen(message) {
			websocket.send(document.getElementById("userName").innerHTML);
		}
		
		var listMessLoad ="";
		function processMessage(message) {
			console.log(message);
	          var listOnline = document.getElementById("listOnline");
	          var listOffline = document.getElementById("listOffline");
			if (message.data.startsWith("list_user")) {
				var listFriend = document.getElementById("listFriend").innerHTML.toString();
				listOnline.innerHTML="";
				listOffline.innerHTML="";
				var listUser = message.data.replace("list_user", "");
				var usersOnline = listUser.split("\n");
				var usersOffline = listFriend.split("///");
				//load danh sachs ban be
				for(var j=0 ; j<usersOffline.length-1;j++){
						var kq = "";
						for(var i=0 ; i<usersOnline.length-1;i++){
							
							if(usersOnline[i]==usersOffline[j]) kq = usersOnline[i];				
						}
						if(kq!=""){
							if(kq==document.getElementById("userName").innerHTML);
							else{var html = '<li class="clearfix" ><img alt=" tar" onclick ="Loadmessage(\'' + kq+ '\')" height="55px" src="https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png" width="55px" /><div class="about"><div class="name" name="name" value ="'+kq+'">'+kq+'</div><div class="status"><i class="fa fa-circle online"></i><i class="fa fa-address-book-o" >Bạn Bè</i><div id="'+kq+'"></div></div></div></li>';
							listOnline.insertAdjacentHTML('beforeend', html);
							}
						}
						else{
							html ='<li class="clearfix"><img alt="avatar" onclick ="Loadmessage(\'' + usersOffline[j]+ '\')" height="55px"src="https://st.gamevui.com/images/image/2020/09/17/AmongUs-Avatar-maker-hd01.jpg"width="55px" /><div class="about"><div class="name">'+usersOffline[j]+'</div><div class="status"><i class="fa fa-circle offline"></i><i class="fa fa-address-book-o" >Bạn Bè</i><div id="'+usersOffline[j]+'"></div></div></div></li>'
							listOffline.insertAdjacentHTML('beforeend', html);
						}
					}
			}
			else{
				//load tin nhan
				if (message.data.startsWith("loadMess@@")) {
					listMessLoad = message.data.replace("loadMess@@", "");
					var Chats = listMessLoad.split("@@");
					for(var j=0 ; j<Chats.length;j++){
							var chat =Chats[j].split("///");
							var sender = chat[0];
							console.log(sender);
							var mess = chat[1];
							if(sender!=document.getElementById("friend").innerHTML){
								var today = new Date();
								 
								    // Giờ, phút, giây hiện tại
								var h = today.getHours();
								var m = today.getMinutes();
								var s = today.getSeconds();
								var chatUI = document.getElementById("chat-history");
								var html ='<li class="clearfix"><div class="message-data align-right"><span class="message-data-time">'+h+':'+m+':'+s+'</span> &nbsp; &nbsp;<span class="message-data-name">'+sender+'</span> <i class="fa fa-circle me"></i></div><div class="message other-message float-right">'+mess+'</div></li>';
								chatUI.insertAdjacentHTML('beforeend', html);
							}
							else{
								var today = new Date();
							    // Giờ, phút, giây hiện tại
							    var h = today.getHours();
							    var m = today.getMinutes();
							    var s = today.getSeconds();
								var chatUI = document.getElementById("chat-history");
								 var html ='<li><div class="message-data"><span class="message-data-name"><i class="fa fa-circle online"></i>'+sender+'</span><span class="message-data-time">'+h+':'+m+':'+s+'</span></div><div class="message my-message">'+mess+'</div></li>'
								 chatUI.insertAdjacentHTML('beforeend', html);		
							}
						}
				}else{
					//gui tin nhan
					if(message.data.startsWith("addmess@@")){
						var listMess = message.data.replace("addmess@@", "");
						var Chats = listMess.split("@@");
						var sender = Chats[0];
						console.log(sender);
						var mess = Chats[1];
						if(sender==document.getElementById("friend").innerHTML){
							var today = new Date();
							 
							    // Giờ, phút, giây hiện tại
							var h = today.getHours();
							var m = today.getMinutes();
							var s = today.getSeconds();
							var chatUI = document.getElementById("chat-history");
							var html ='<li><div class="message-data"><span class="message-data-name"><i class="fa fa-circle online"></i>'+sender+'</span><span class="message-data-time">'+h+':'+m+':'+s+'</span></div><div class="message my-message">'+mess+'</div></li>'
							chatUI.insertAdjacentHTML('beforeend', html);
						}
						else{
							// hien thi dau có tin nhan moi
							html ='<i class="fa fa-plus" style="color:red">Có tin nhắn mới!</i>'
							document.getElementById(sender).insertAdjacentHTML('beforeend', html);
						}
					}else{
						if(message.data.startsWith("mess@@")){
							var listMess = message.data.replace("mess@@", "");
							var Chats = listMess.split("@@");
							var sender = Chats[0];
							console.log(sender);
							var mess = Chats[1];
								var today = new Date();
								 
								    // Giờ, phút, giây hiện tại
								var h = today.getHours();
								var m = today.getMinutes();
								var s = today.getSeconds();
								var chatUI = document.getElementById("chat-history");
								var html ='<li class="clearfix"><div class="message-data align-right"><span class="message-data-time">'+h+':'+m+':'+s+'</span> &nbsp; &nbsp;<span class="message-data-name">'+sender+'</span> <i class="fa fa-circle me"></i></div><div class="message other-message float-right">'+mess+'</div></li>';
								chatUI.insertAdjacentHTML('beforeend', html);
						}else{
							if (message.data.startsWith("findfriend@@")) {
								var listFriend = document.getElementById("listFriend").innerHTML.toString();
								listOnline.innerHTML="";
								listOffline.innerHTML="";
								var listFind = document.getElementById("listFind");
								listFind.innerHTML="";
								var listUser = message.data.replace("findfriend@@", "");
								if(listUser=="null"){
									var html = '<div>Không tìm thấy người này!</div>';
									listFind.insertAdjacentHTML('beforeend', html);
								}
								else{
									var usersFind = listUser.split("///");
									var Friend = listFriend.split("///");
									//load danh sachs ban be
									for(var j=1 ; j<usersFind.length;j++){
											var kq = false;
											for(var i=0 ; i<Friend.length-1;i++){
												
												if(Friend[i]==usersFind[j]) kq = true;				
											}
											if(!kq){
												if(usersFind[j]==document.getElementById("userName").innerHTML);
												else{var html = '<li class="clearfix" ><img alt="avatar" height="55px" onclick ="Loadmessage(\'' + usersFind[j]+ '\')" src="https://rtfm.co.ua/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png" width="55px" /><div class="about"><div class="name" name="name" value ="'+usersFind[j]+'">'+usersFind[j]+'</div><div class="status"><i class="fa fa-user-plus" style="color:blue" onclick="addFriend(\'' + usersFind[j]+ '\')" >Kết Bạn</i></div></div></li>';
												listFind.insertAdjacentHTML('beforeend', html);
												}
											}
											else{
												var html = '<li class="clearfix"><img alt="avatar" height="55px"  onclick ="Loadmessage(\'' + usersFind[j]+ '\')" src="https://rtfm.co.ua/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png" width="55px" /><div class="about"><div class="name" name="name" value ="'+usersFind[j]+'">'+usersFind[j]+'</div><div class="status"><i class="fa fa-address-book-o" >Bạn Bè</i></div></div></li>';
												listFind.insertAdjacentHTML('beforeend', html);
											}
										}
								}
							}
							else{
								//ket bạn
								if(message.data.startsWith("addFriend@@")){
									if(message.data.replace("addFriend@@", "")=="ok"){
										alert("thêm Bạn Bè Thành Công");
										location.reload();
									}
									else{
										alert("thêm Bạn Bè Thất Bại");
									}
			 					}
							}
						}
					}
				}
			}
		}
		function processClose(message) {
			//textAreaMessage.value += "Server Disconnect... \n";
		}
		function processError(message) {
			//textAreaMessage.value += "Error... " + message + " \n";
		}

		function sendMessage() {
			console.log(textMessage.value);
			if(textMessage.value!=""&&document.getElementById("friend").innerHTML.toString()!=""){
				websocket.send("mess@@"+document.getElementById("friend").innerHTML.toString()+"@@"+textMessage.value);
				textMessage.value="";
			}
		}
		function Loadmessage(user){
			document.getElementById("friend").innerHTML=user;
			document.getElementById("chat-history").innerHTML="";
			document.getElementById(user).innerHTML="";
			websocket.send("LoadMess@@"+user);
		}
		function findFriend(){
			var name = document.getElementById("findfriend").value;
			if(name==""){
				location.reload();
			}
			else{
				websocket.send("findFriend@@"+name);
			}
		}
		function addFriend(user){
				websocket.send("addFriend@@"+user);
		}
		
		function refresh(){
			location.reload();
		}
		
		function Unfriend(){
				websocket.send("Unfriend@@"+document.getElementById("friend").innerHTML.toString());
			location.reload();
		}
		function findMessage(){
			var Chats = listMessLoad.split("@@");
			document.getElementById("chat-history").innerHTML="";
			for(var j=0 ; j<Chats.length;j++){
					var chat =Chats[j].split("///");
					var sender = chat[0];
					console.log(sender);
					var mess = chat[1];
					console.log(document.getElementById("findmessage").value.toString());
					var search =mess.search(document.getElementById("findmessage").value.toString())
					console.log(search);
					if(search!=-1){
						if(sender!=document.getElementById("friend").innerHTML){
							var today = new Date();
							 
							    // Giờ, phút, giây hiện tại
							var h = today.getHours();
							var m = today.getMinutes();
							var s = today.getSeconds();
							var chatUI = document.getElementById("chat-history");
							var html ='<li class="clearfix"><div class="message-data align-right"><span class="message-data-time">'+h+':'+m+':'+s+'</span> &nbsp; &nbsp;<span class="message-data-name">'+sender+'</span> <i class="fa fa-circle me"></i></div><div class="message other-message float-right">'+mess+'</div></li>';
							chatUI.insertAdjacentHTML('beforeend', html);
						}
						else{
							var today = new Date();
						    // Giờ, phút, giây hiện tại
						    var h = today.getHours();
						    var m = today.getMinutes();
						    var s = today.getSeconds();
							var chatUI = document.getElementById("chat-history");
							 var html ='<li><div class="message-data"><span class="message-data-name"><i class="fa fa-circle online"></i>'+sender+'</span><span class="message-data-time">'+h+':'+m+':'+s+'</span></div><div class="message my-message">'+mess+'</div></li>'
							 chatUI.insertAdjacentHTML('beforeend', html);		
						}
					}

				}
	}
		
		
		
		
		