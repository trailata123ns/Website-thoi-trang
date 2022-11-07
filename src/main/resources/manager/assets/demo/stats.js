
function generateColor() {
  let r = parseInt(Math.random() * 255);
  let g = parseInt(Math.random() * 255);
  let b = parseInt(Math.random() * 255);
  return `rgb(${r},${g},${b})`
}

function cateChart(id, cateLables = [], cateInfo = []) {

  const colors = [];

  for (let i = 0; i < cateInfo.length; i++) {
    colors.push(generateColor())
  }

  const data = {
    labels: cateLables,
    datasets: [{
      label: 'Thống kê sản phẩm theo danh mục',
      data: cateInfo,
      backgroundColor: colors,
      hoverOffset: 4
    }]
  };

  const config = {
    type: 'doughnut',
    data: data,
  };

  let c = document.getElementById(id).getContext("2d")
  new Chart(c, config)
}

function proChart(id, proLables = [], proInfo = []) {

  const colors = [];

  for (let i = 0; i < proInfo.length; i++) {
    colors.push(generateColor())
  }

  const data = {
    labels: proLables,
    datasets: [{
      label: 'Thống kê doanh thu theo sản phẩm',
      data: proInfo,
      backgroundColor: colors,
      borderColor:colors,
      tension: 0.1,
      hoverOffset: 4
    }]
  };

  const config = {
    type: 'bar',
    data: data,
  };

  let c = document.getElementById(id).getContext("2d")
  new Chart(c, config)
}