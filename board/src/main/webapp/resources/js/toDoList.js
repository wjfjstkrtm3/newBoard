window.onload = function() {
	/*var deleteSel = document.getElementById("DeleteSel");*/
	document.getElementById("deleteSel").addEventListener("click", deleteSeleted);
	var btnDelLast = document.getElementById("btnDelLast");
	document.getElementById("btnDelAll").addEventListener("click", deleteAll);
	var text = document.getElementById("text-basic");
	var list = document.getElementById("listBody");
	var id = 0;
	
	
	
	
	text.onkeyup = function(event) {
		if(event.which == 13) {
			if(text.value.trim() == "") {
				text.focus();
			} else {
				// 글쓰기
				id++;
				var tr = document.createElement("tr");
				var td01 = document.createElement("td");
				
				var inputBox = document.createElement("input");
				inputBox.setAttribute("type", "checkbox");
				inputBox.setAttribute("class", "btn-chk");
				td01.appendChild(inputBox);
				
				var td02 = document.createElement("td");
				td02.innerText = text.value;
				
				tr.appendChild(td01);
				tr.appendChild(td02);
				
				list.appendChild(tr);
				
				text.value = "";
				text.focus();
			}
			
		}
		
	}
	
	// 선택 삭제 
	function deleteSeleted(event) {
		var body = document.getElementById("listBody");
		var checkBoxState = document.querySelectorAll(".btn-chk");
		/*
		nodeType
		요소 노드(element node)	    1
		속성 노드(attribute node)  2
		텍스트 노드(text node)	    3
		주석 노드(comment node)	    8
		문서 노드(document node)   9*/
		
		
		for(var index in checkBoxState) {
			if(checkBoxState[index].nodeType == 1 && checkBoxState[index].checked == true) {
				body.removeChild(checkBoxState[index].parentNode.parentNode);
			}
			
		}
	}
	
	// 마지막 삭제
	btnDelLast.onclick = function() {
		var body = document.getElementById("listBody");
		body.lastChild.remove();
	}
	
	
	// 전체 삭제
	function deleteAll() {
		var body = document.getElementById("listBody");
		while(body.hasChildNodes) {
			body.removeChild(body.firstChild);
		}
		
	}
	
	
	
}

