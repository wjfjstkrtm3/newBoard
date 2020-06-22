var btnNew = document.getElementById("btnAdd");

function addNewItem(list, itemText) {
	var listItem = document.createElement("li");
	listItem.innerText = itemText;
	list.appendChild(listItem);
}

btnNew.onclick = function() {
	var inputText = document.getElementById("inputText");
	var itemText = inputText.value.trim();

	if(itemText === "") {
		return false;
	}
	
	addNewItem(document.getElementById("todoList"), itemText);
}


