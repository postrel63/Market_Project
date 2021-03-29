<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>






<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="inner-content"></div>
			</div>
		</div>
	</div>
</footer>

<!-- 웹소켓 -->
<script type="text/javascript">
		var socket = null;
        //세션에 로그인세션과 가게세션이 둘다 존재하면 웹소켓을 실행시켜서 웹소켓안에 세션을 저장할 때 로그인세션과 가게세션 두 정보가 다 attr된 상태로 저장되도록 한다.

  $(document).ready(function() {

	if(socket ==null){
		console.log("closed Socket")
		}else{
		console.log("opend Socket")
			}
	  
		
		//세션에 로그인 세션은 존재하고 사업자 이면서  가게 세션은 setattribute 되지 않았을 때 가게선택을 위해 modal 띄워줌
		if(${not empty sessionScope.loginId}){    //일단 로그인 세션이 존재하는 회원인 경우
			var result = memberorstore(); 		  //사업자를 판단  사업자면 1 일반사용자면 0
			console.log(result);
			if(result == '11'){				//사업자이면
				changeDropdown();		      
				if(${empty sessionScope.stcode}){ //사업자 코드가 이미 등록되있는지 보고 아니면
			storecountCheck(); 					  // 사업자 코드를 등록해준다.
					}else{
						console.log("사업자이고 코드가 이미 등록되어잇음")
	    			connectWS();
						}
				return;
				}else if(result == '00'){
	    			connectWS();
					}
			
		}

		if(${not empty sessionScope.loginId}){
		
			
			}
		
				
	});



    
		function connectWS(){
			console.log("wwweb ssssocket")
		var sock = new SockJS("/echo");
		socket = sock;
		
		sock.onopen = function () {
	        console.log('Info: connection opened.');
	    };
		
		sock.onmessage = function(event){
		var data = event.data;
			console.log("receivedMessage",data+'\n');

			//주문을 하면 알림창이 뜨고 사라짐
			  let $socketAlert = $('div#socketAlert');
		        $socketAlert.html(data);
		        $socketAlert.css('display', 'block');
		        setTimeout( function() {
		        	$socketAlert.css('display', 'none');
		        }, 10000);
			//주문이 가게에 뜨는 function
			//	showorder(data);
			var cmd = data.substring(0,2);
			var newchcode = data.slice(-15,data.length);
			console.log(cmd);
			if(cmd == "새로"){
				console.log("새로운주문 도착했대");
				newmenuappend(newchcode);
				};
				};


	
		
		sock.onclose = function(){
			//$("#chat").append("연결 종료");
			setTimeout( function(){ connectWS(); }, 1000); // retry connection!!
		}

	    sock.onerror = function (event) {
		    console.log('Error: err');
		};
			}

		function disconnect(){
			socket.onclose();
			};

		//새로운 주문을 append 하기위함 
			function newmenuappend(newchcode){
				console.log("newmenuappend" +newchcode);
					$.ajax({
						type : "post",
						url : "newmenuappend",
						data : {
						"chcode" :newchcode,
							},
						dataType : "json",
						success : function(result) {
							console.log("newmenuappend result ::" + result);
							neworderappend(result);
						},
						error : function() {
							alert("storeChoice연결실패");
						}
					});

					}


		function neworderappend(result){
		console.log("neworderappend");
		var output="";
		var chcode = result.chcode;
		var chcode2 = chcode.substring(10);
		var chdate = result.chdate;
		var allprcount = result.allprcount;
		var allprprice = result.allprprice;

			console.log(chcode + "::" + allprcount + "::" + chdate);

			output += "<label for='orderlist"+chcode2+"'>"
			output += "<li class='neworder' onclick='orderdetail(" + chcode
					+ ")'>";
			output += "<input type='radio' id='orderlist"+chcode2+"' name='orderlisttab'>";
			output += "<p class='newordercode'>" + chdate + "</p>";
			output += "<span class='newordercount'>ㅤㅤㅤㅤ</span>";
			output += "<span class='newordercount'>[메뉴" + allprcount
					+ "개]</span>";
			output += "<span class='newordercount'>" + allprprice + "원</span>";
			output += "</li>";
			output += "</label>"
		
		$("#printorderlist").append(output);
			
		
			}

			

		//스토어 리스트를 불러와서 확인
		function memberorstore(){
			var memberorstoreResult;
		console.log("memberorstore");
			$.ajax({
				type : "post",
				url : "memberorstore",
				async: false, //비동기식이 아닌 동기식으로
				data : {},
				dataType : "json",
				success : function(result) {
					console.log("memberorstore result ::" + result);
					memberorstoreResult=result;
				},
				error : function() {
					alert("memberorstore연결실패");
				}
			});
			return memberorstoreResult;
			

		}

		function storecountCheck() {
			console.log("사업자 OK")
			$.ajax({
				type : "post",
				url : "storeChoice",
				data : {},
				dataType : "json",
				success : function(result) {
					console.log("storeChoice result ::" + result);
					ChoiceStoreModal(result);
				},
				error : function() {
					alert("storeChoice연결실패");
				}
			});
		}

		function ChoiceStoreModal(result) {
			console.log("ChoiceStoreModal");

			
			var outputChoiceStore ="";

			 for(var i in result){
			var stcode = result[i].stcode;
			var stname = result[i].stname;
			var marketname = result[i].marketname;
			console.log(stcode);
			console.log(stname);


			

			outputChoiceStore += "<a href='#'  value='"+stcode+"'  onclick='stcodeChoice(this);' class='list-group-item list-group-item-action flex-column align-items-start choiceOneStore'>"
			outputChoiceStore += "<div class='d-flex w-100 justify-content-between'>"
			outputChoiceStore += "<h5 class='mb-1'>"+stname+"</h5>"
			outputChoiceStore += "</div>"
			outputChoiceStore += "<small>"+marketname+"</small>"
			outputChoiceStore += "</a>"

			$("#divChoiceStore").html(outputChoiceStore);
			



				}
			
			$('#ChoiceStore').modal('show')
		}

			
			function stcodeChoice(obj){
				var stcode = $(obj).attr('value');
				console.log(stcode);

				$.ajax({
					type : "post",
					url : "choiceOneStore",
					data : {
						"stcode": stcode,
						},
					async:false,
					//dataType : "json",  error: Unexpected end of JSON input
					success : function() {
						console.log("choiceOneStore result ::");
						connectWS();
						$('#ChoiceStore').modal('hide');
						
						
					},
					error:function(request,status,error){
				        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				       }
				});

				
				}

			function changeDropdown(){ //사업자만 mypage바뀌도록 설정
				var output='';

				output+="<a class='dropdown-item' href='memberView?mid=${sessionScope.loginId}'>내 정보</a>"; 
				output+="<a class='dropdown-item' href='storejoinForm'>사업장 등록</a>";
				output+="<a class='dropdown-item' href='memberstoreView?loginId=${sessionScope.loginId}'>내 사업장</a>";
				output+="<a class='dropdown-item' href='storeProducts?loginId=${sessionScope.loginId}'>사업장 물품관리</a>";
				$("#changedrop").html(output);
					
				}

			function changeStcode(){
				}

				
		
	</script>


<!-- Bootstrap core JavaScript -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<!-- Additional Scripts -->
<script src="/resources/js/custom.js"></script>
<script src="/resources/js/owl.js"></script>
<script src="/resources/js/slick.js"></script>
<script src="/resources/js/isotope.js"></script>
<script src="/resources/js/accordions.js"></script>





</body>

</html>
