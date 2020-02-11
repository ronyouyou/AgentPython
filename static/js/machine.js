var pageURL = window.location.href;
var idHote = pageURL.substr(pageURL.lastIndexOf('/') + 1);
var dataMachine;
var elem = document.querySelector('.collapsible.expandable');
  var instance = M.Collapsible.init(elem, {
      accordion: false
});
var autoReload = setInterval(refreshDatas,5000);
function refreshDatas(){
	fetch('/machine/'+idHote+'/getInfos')
	.then(response => response.json())
	.then(data => {
	  this.dataMachine = data;
	})
	.catch(error => console.error(error));
	drawChartLine1();
	drawChart();
	drawTable();
}

fetch('/machine/'+idHote+'/getInfos')
.then(response => response.json())
.then(data => {
  this.dataMachine = data;
})
.catch(error => console.error(error))
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChartLine1);
function drawChartLine1() {
  var dataTable = new google.visualization.DataTable();
  dataTable.addColumn('number', 'Total');
  dataTable.addColumn('number', 'Free');
  dataTable.addColumn('number', 'Used');
  dataTable.addColumn('number', 'Buffers');
  dataTable.addColumn('number', 'Cached');

  for(var i = 0; i < dataMachine.memoryUsage.length; i++){
    dataTable.addRow([dataMachine.memoryUsage[i].memoireTotal,
      dataMachine.memoryUsage[i].memoireLibre,
      dataMachine.memoryUsage[i].memoireOccupe,
      dataMachine.memoryUsage[i].buffer,
      dataMachine.memoryUsage[i].cache]);
  }

  var options_stacked = {
    isStacked: 'relative',
    height: 300,
    legend: {maxLines: 3},
    vAxis: {
      minValue: 0,
      ticks: [0,.15, .3, .45, .6, .75,.9, 1]
    }
  };

  var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
  chart.draw(dataTable, options_stacked);
}
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
  var cpuUsed = 0;
  var freeCPU = 0;
  var dataTable = new google.visualization.DataTable();
  dataTable.addColumn('string', 'CPU');
  dataTable.addColumn('number', 'Used');
  for(var index = 0; index < dataMachine.cpuUsage.length; index++) { 
    console.log(freeCPU,cpuUsed);
    freeCPU = freeCPU + dataMachine.cpuUsage[index].frequenceMax;
    cpuUsed = cpuUsed + dataMachine.cpuUsage[index].frequence;
  }
  freeCPU = freeCPU / dataMachine.cpuUsage.length;
  cpuUsed = cpuUsed / dataMachine.cpuUsage.length;
  dataTable.addRow(["Free",freeCPU]);
  dataTable.addRow(["Used",cpuUsed])
  var options = {
    title: 'CPU USAGE',
    pieHole: 0.4,
  };

  var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
  chart.draw(dataTable, options);
}

google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);

function drawTable() {
  var dataTable = new google.visualization.DataTable();
  dataTable.addColumn('number', 'Available');
  dataTable.addColumn('string', 'File system');
  dataTable.addColumn('string', 'Mounted');
  dataTable.addColumn('string', 'Pourcentage');
  dataTable.addColumn('number', 'Size');
  dataTable.addColumn('number', 'Used');
  for(var i = 0; i < dataMachine.diskUsage.length; i++){
    dataTable.addRow([dataMachine.diskUsage[i].available,
      dataMachine.diskUsage[i].fileSystem,
      dataMachine.diskUsage[i].mounted,
      dataMachine.diskUsage[i].pourcentage,
      dataMachine.diskUsage[i].size,
      dataMachine.diskUsage[i].used]);
  }
  var table = new google.visualization.Table(document.getElementById('table_div'));
  table.draw(dataTable, {width: '100%', height: '100%'});
}

