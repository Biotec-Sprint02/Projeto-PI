function changeToRegister() {
    login.style = 'display: none';
    register.style = 'display: block, flex';
}

function changeToLogin() {
    register.style = 'display: none';
    login.style = 'display: block, flex';
}

function changeSteps(next) {
    if (next) {
        register_step1.style = 'display: none';
        register_step2.style = 'display: block, flex';
    } else {
        register_step1.style = 'display: block, flex';
        register_step2.style = 'display: none';
    }

}

function valida_email() {
    var emaill = email.value;
    if (emaill.includes('@') == true && emaill.includes('.com') == true) {
        email.style = `border-color: green`;
        msg.style = 'display:block';
        msg.innerHTML = `E-mail válido`;
    } else {
        email.style = 'border-color:red';
        msg.style = 'display:block';
        msg.innerHTML = 'Digite um email válido!';
    }
}

function valida_senha() {
    var password = senha.value;
    if (password.length >= 8) {
        senha.style = `border-color: green`;
        mens.innerHTML = `Senha válida`;
        mens.style = 'display:block';
    } else {
        senha.style = 'border-color:red';
        mens.style = 'display:block'
        mens.innerHTML = 'Digite uma senha válida!';
    }
}

function validar_empresa() {
    if ((nome.value).length < 1) {
        nome.style = "border-color: red";
    } else {
        nome.style = "border-color: green";
    }
}
function validar_cnpj() {
    if ((cnpjEmpresa.value).length == 14) {
        cnpjEmpresa.style = "border-color: green";
    } else {
        cnpjEmpresa.style = "border-color: red";
    }
}
function validar_rua() {
    if ((ruaEmpresa.value).length < 7) {
        ruaEmpresa.style = "border-color: red";
    } else {
        ruaEmpresa.style = "border-color: green";
    }
}
function validar_numero() {
    if ((numEmpresa.value).length < 1) {
        numEmpresa.style = "border-color: red";
    } else {
        numEmpresa.style = "border-color: green";
    }
}
function validar_bairro() {
    if ((bairroEmpresa.value).length < 5) {
        bairroEmpresa.style = "border-color: red";
    } else {
        bairroEmpresa.style = "border-color: green";
    }
}
function validar_cidade() {
    if ((cidadeEmpresa).length < 3) {
        cidadeEmpresa.style = "border-color: red";
    } else {
        cidadeEmpresa.style = "border-color: green";
    }
}
function validar_cep() {
    if ((cepEmpresa).length > 7) {
        cepEmpresa.style = "border-color: red";
    } else {
        cepEmpresa.style = "border-color: green";
    }
}
function validar_email() {
    if (emailEmpresa.includes('@') == true && emailEmpresa.includes('.com')) {
        alert("ALE PAUZUDO");
        emailEmpresa.style = "border-color: green";
    } else {
        emailEmpresa.style = "border-color: red";
    }
}
function validar_senha2() {
    if ((senhaEmpresa).length > 7) {
        alert("CALA BOCA BOLIVIANO");
        senhaEmpresa.style = "border-color: green";
    } else {
        senhaEmpresa.style = "border-color: red";
    }
}