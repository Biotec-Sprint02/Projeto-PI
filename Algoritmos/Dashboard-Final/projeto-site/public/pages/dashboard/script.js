 /* FUNÇÕES DO JS PARA A TROCA DE TELAS */
 function changeToVehicles() {
    home.style = "display: none";
    vehicles.style = "display: block";
    vehicles.style = "display: flex";
    profile.style = "display: none";
}

function changeToIndex() {
    home.style = "display: block";
    home.style = "display: flex"
    vehicles.style = "display: none";
    profile.style = "display: none";
}

function changeToProfile() {
    home.style = "display: none";
    vehicles.style = "display: none";
    profile.style = "display: block";
}

var config_chart_temp = {
    type: 'line',
    data: {
        labels: [],
        datasets: [{
            label: 'Temperatura',
            backgroundColor: window.chartColors.red,
            borderColor: window.chartColors.red,
            data: [],
            fill: false,
        }]
    },
    options: {
        responsive: true,
        title: {
            display: true,

        },
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Horário da Leitura'
                }
            }],
            yAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'ºC'
                }
            }]
        }
    }
};

function get_temperatura() {
    var http = new XMLHttpRequest();
    http.open('GET', 'http://localhost:3000/api/', false);
    http.send(null);

    var obj = JSON.parse(http.responseText);
    document.getElementById('average').textContent = obj.average;
    document.getElementById('averageHour').textContent = obj.averageHour;

    document.getElementById('average2').textContent = obj.average;
    document.getElementById('average3').textContent = obj.average;
    document.getElementById('average4').textContent = obj.average;
    document.getElementById('average5').textContent = obj.average;

    if (obj.data.length == 0) {
        return;
    }
    let test = 0;
    obj.data.forEach(el => {
        test = el
    })
    return test;
}
this.lastIndexTemp = 0;
this.time = 0;

function get_humidade() {
    var http = new XMLHttpRequest();
    http.open('GET', 'http://localhost:3000/api/humidity', false);
    http.send(null);

    var obj = JSON.parse(http.responseText);
    document.getElementById('averageHumidity').textContent = obj.average;
    document.getElementById('averageHourHumidity').textContent = obj.averageHour;
    document.getElementById('averageHumidity2').textContent = obj.average;
    document.getElementById('averageHumidity3').textContent = obj.average;
    document.getElementById('averageHumidity4').textContent = obj.average;
    document.getElementById('averageHumidity5').textContent = obj.average;

    if (obj.data.length == 0) {
        return;
    }
    let test = 0;
    obj.data.forEach(el => {
        test = el
    })
    return test;
}

function receberNovasTemperaturas() {
    setTimeout(() => {
        if (config_chart_temp.data.datasets[0].data.length >= 6) {
            config_chart_temp.data.labels.shift();
            config_chart_temp.data.datasets[0].data.shift();
        }

        if (config_chart_humi.data.datasets[0].data.length >= 6) {
            config_chart_humi.data.labels.shift();
            config_chart_humi.data.datasets[0].data.shift();
        }

        var agora = new Date();
        var hora = agora.getHours();
        var minuto = agora.getMinutes();
        var segundo = agora.getSeconds();
        var momento = `${hora > 9 ? '' : '0'}${hora}:${minuto > 9 ? '' : '0'}${minuto}:${segundo > 9 ? '' : '0'}${segundo}`;
        // esse "novoRegistro" será recuperado do backend futuramente
        var novoRegistro = {
            momento: momento,
            leitura: get_temperatura()
        };

        var novoRegistroHumi = {
            momento: momento,
            leitura: get_humidade()
        }
        // config_chart_temp.data.labels.shift(); // apagar o primeiro
        config_chart_temp.data.labels.push(novoRegistro.momento); // incluir um novo momento
        // config_chart_temp.data.datasets[0].data.shift();  // apagar o primeiro
        config_chart_temp.data.datasets[0].data.push(novoRegistro.leitura); // incluir uma nova leitura

        config_chart_humi.data.labels.push(novoRegistroHumi.momento);

        config_chart_humi.data.datasets[0].data.push(novoRegistroHumi.leitura);

        window.graficoLinha.update();
        window.graficoHumidade.update();

        receberNovasTemperaturas()
    }, 7000); // 7000 ms -> 7 segundos
}

//Gráfico umidade
var config_chart_humi = {
    type: 'line',
    data: {
        labels: [],
        datasets: [{
            label: 'Umidade',
            backgroundColor: window.chartColors.blue,
            borderColor: window.chartColors.blue,
            data: [],
            fill: false,
        }]
    },
    options: {
        responsive: true,

        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Horário da Leitura'
                }
            }],
            yAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: '%'
                }
            }]
        }
    }
};

function plotarGrafico() {
    var contexto_temperatura = document.getElementById('chart').getContext('2d');
    var contexto_humidade = document.getElementById('chart-humidity').getContext('2d');
    window.graficoLinha = new Chart(contexto_temperatura, config_chart_temp);
    window.graficoHumidade = new Chart(contexto_humidade, config_chart_humi);

    receberNovasTemperaturas();
}
window.onload = plotarGrafico;