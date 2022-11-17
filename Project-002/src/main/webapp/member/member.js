function go_save() {
  if (document.formm.id.value == "") {
    alert("���̵� �Է��Ͽ� �ּ���.");
    document.formm.id.focus();
  } else if (document.formm.id.value != document.formm.reid.value) {
    alert("�ߺ�Ȯ���� Ŭ���Ͽ� �ּ���.");
    document.formm.id.focus();
  } else if (document.formm.pwd.value == "") {
    alert("��й�ȣ�� �Է��� �ּ���.");
    document.formm.pwd.focus();
  } else if ((document.formm.pwd.value != document.formm.pwdCheck.value)) {
    alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
    document.formm.pwd.focus();
  } else if (document.formm.name.value == "") {
    alert("�̸��� �Է��� �ּ���.");
    document.formm.name.focus();
  } else if (document.formm.email.value == "") {
    alert("�̸����� �Է��� �ּ���.");
    document.formm.email.focus();
  } else {
    document.formm.action = "ShopServlet?command=join";
    document.formm.submit();
  }
}

function idcheck() {
  if (document.formm.id.value == "") {
    alert('���̵� �Է��Ͽ� �ֽʽÿ�.');
    document.formm.id.focus();
    return;
  }
  var url = "ShopServlet?command=id_check_form&id=" 
+ document.formm.id.value;
  window.open( url, "_blank_1",
"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=330, height=200");
}

function post_zip() {
  var url = "ShopServlet?command=find_zip_num";
  window.open( url, "_blank_1",
"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=550, height=300, top=300, left=300, ");
}

function go_next() {
  if (document.formm.okon1[0].checked == true) {
    document.formm.action = "ShopServlet?command=join_form";
    document.formm.submit();
  } else if (document.formm.okon1[1].checked == true) {
    alert('����� �����ϼž߸� �մϴ�.');
  }
}