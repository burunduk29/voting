<?php
include '../includes/conn.php'; // Убедитесь, что путь к connection.php верный

// Определение функции slugify
function slugify($text) {
    // Заменяем пробелы и специальные символы
    $text = preg_replace('~[^\pL\d]+~u', '-', $text);
    // Транслитерация
    $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);
    // Удаляем символы, которые не являются буквой, цифрой или дефисом
    $text = preg_replace('~[^-\w]+~', '', $text);
    // Удаляем лишние дефисы
    $text = trim($text, '-');
    // Приводим к нижнему регистру
    $text = strtolower($text);
    // Если текст пуст, возвращаем 'n-a'
    return empty($text) ? 'n-a' : $text;
}

// Остальной код
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Распечатать - Рейтинг кандидатов</title>
    <style>
        /* Стили для печати */
        body {
            font-family: Times, serif;
            font-size: 17px;
            color: black;
        }
        .container {
            text-align: center;
            margin-top: 50px;
        }
        .row {
            margin-bottom: 20px;
        }
        .box {
            background-color: #d8d1bd;
            border: 1px solid #2F4F4F;
            padding: 20px;
        }
        h3, h4 {
            margin: 0;
            padding: 5px;
        }
    </style>
    <!-- Подключение Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body onload="window.print()">
<div class="container">
    <h3><b>Рейтинг кандидатов</b></h3>
    <?php
    $sql = "SELECT * FROM positions ORDER BY priority ASC";
    $query = $conn->query($sql);
    while($row = $query->fetch_assoc()) {
        echo "
        <div class='row'>
            <div class='col-sm-6'>
                <div class='box'>
                    <h4><b>".$row['description']."</b></h4>
                    <div class='chart'>
                        <canvas id='".slugify($row['description'])."' style='height: 200px;'></canvas>
                    </div>
                </div>
            </div>
        </div>";
        
        $sqlCandidates = "SELECT * FROM candidates WHERE position_id = '".$row['id']."'";
        $cquery = $conn->query($sqlCandidates);
        $carray = array();
        $varray = array();
        
        while($crow = $cquery->fetch_assoc()){
            array_push($carray, $crow['lastname']);
            $sqlVotes = "SELECT * FROM votes WHERE candidate_id = '".$crow['id']."'";
            $vquery = $conn->query($sqlVotes);
            array_push($varray, $vquery->num_rows);
        }
        
        $candidatesJSON = json_encode($carray);
        $votesJSON = json_encode($varray);
        ?>
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                var ctx = document.getElementById('<?php echo slugify($row['description']); ?>').getContext('2d');
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: <?php echo $candidatesJSON; ?>,
                        datasets: [{
                            label: 'Votes',
                            data: <?php echo $votesJSON; ?>,
                            backgroundColor: 'rgba(60, 141, 188, 0.9)',
                            borderColor: 'rgba(60, 141, 188, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            x: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            });
        </script>
        <?php
    }
    ?>
</div>
</body>
</html>
