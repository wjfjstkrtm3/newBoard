/*var btnNew = document.getElementById("btnAdd");*/
/*var totalItems = 0;*/
var inputText = document.getElementById("inputText");
inputText.focus();

var doneList = document.getElementById("doneList");

function moveItem() {
	var listItem = document.getElementById(this.id);
	doneList.appendChild(listItem);
}

function addNewItem(list, itemText) {
	var date = new Date();
	var id = "" + date.getHours() + date.getMinutes() + date.getSeconds() + date.getMilliseconds();
	
	var listItem = document.createElement("li");
	listItem.id = 'li_' + id;	
	listItem.ondblclick = moveItem;
	
	var checkBox = document.createElement("input");
	checkBox.type = "checkBox";
	checkBox.id = 'cb_' + id;
	checkBox.onclick = updateItemStatus;
	
	var span = document.createElement("span");
	span.id = 'item_' + id;
	span.innerText = itemText;
	span.onclick = renameItem;

	listItem.appendChild(checkBox);
	listItem.appendChild(span);
	list.appendChild(listItem);
}

function updateItemStatus() {
	console.log(this);
	var chId = this.id.replace("cb_", "");
	var itemText = document.getElementById("item_" + chId);
	
	if(this.checked) {
		itemText.className = "checked";
	} else {
		itemText.className = "";
	}
}

function renameItem() {
	var newText = prompt("다시 지을 이름을 작성하세요");
	
	if(newText === "" || newText === " ") {
		return false;
	}
	this.innerText = newText;
	
}

function removeItem() {
	var listItemId = this.id.replace("li_", "");
	document.getElementById(this.id).style.display="none";
	/*document.getElementById("li_" + listItemId).style.display="none";*/
	
	
}

inputText.onkeyup = function(event) {
/*	console.log(event.which);
	console.log(event.keyCode);*/
	if(event.which == 13) {
		var itemText = inputText.value.trim();
		if(itemText === "") {
			return false;
		}
		addNewItem(document.getElementById("todoList"), itemText);
		inputText.focus();
		inputText.value = "";
	}
	
}


