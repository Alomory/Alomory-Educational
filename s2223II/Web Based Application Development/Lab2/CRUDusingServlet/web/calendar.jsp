<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>BTM Reservation</title>
    <!-- https://picocss.com/docs/ -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css">
    <style>
        th, td {
            text-align: center;
            vertical-align: middle;
        }

        :root {
            --today: rgba(30, 136, 229, 0.5);
        }

        .today {
            background-color: var(--today);
        }

        .past {
            background-color: rgba(0, 0, 0, 0.25);
        }

        .clickable {
            cursor: pointer;
        }

        .clickable:hover {
            background-color: rgba(124, 179, 66, 0.5);
        }
    </style>
</head>
<body>

<main class="container">
    <h1>BTM Reservation</h1>
    <figure>
        <table class="calendar">
            <thead>
            <tr>
                <th colspan="2" id="left" class="clickable" title="Previous month">&lt;</th>
                <th colspan="3" id="month" class="clickable" title="Back to current month"></th>
                <th colspan="2" id="right" class="clickable" title="Next month">&gt;</th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th>Sunday</th>
                <th>Monday</th>
                <th>Tuesday</th>
                <th>Wednesday</th>
                <th>Thursday</th>
                <th>Friday</th>
                <th>Saturday</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </figure>
</main>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        let date = new Date();
        let tempDate = date;

        let calendar = document.querySelector('.calendar');
        let monthHeader = calendar.querySelector('#month');
        let calendarBody = calendar.querySelector('tbody');

        function renderCalendar(month) {
            date = new Date();
            tempDate.setMonth(tempDate.getMonth() + (month || 0));
            let y = tempDate.getFullYear(), m = tempDate.getMonth();
            let firstDay = new Date(y, m, 1).getDay(), lastDay = new Date(y, m + 1, 0).getDate();

            // Set the month and year in the header
            monthHeader.innerText = tempDate.toLocaleString('default', {month: 'long', year: 'numeric'});

            // Loop through the weeks of the month
            calendarBody.innerHTML = '';

            let day = 1;
            while (day <= lastDay) {
                let tr = document.createElement('tr');

                // Loop through the days of the week
                for (let i = 0; i < 7; i++) {
                    let td = document.createElement('td');

                    if (firstDay > 0) {
                        firstDay--;
                    } else if (day <= lastDay) {
                        td.innerText = day.toString();

                        let renderDate = new Date(y, m, day);
                        
                        if (renderDate.toDateString() === date.toDateString())
                            td.classList.add('today');
                        else if (renderDate > date)
                            td.classList.add('clickable');
                        else td.classList.add('past');

                        day++;
                    }

                    tr.appendChild(td);
                }

                calendarBody.appendChild(tr);
            }
        }

        renderCalendar();

        let previousButton = calendar.querySelector('#left');
        let nextButton = calendar.querySelector('#right');

        monthHeader.addEventListener('click', function () {
            tempDate = date;
            renderCalendar();
        });

        // Event handler for the previous button
        previousButton.addEventListener('click', function () {
            renderCalendar(-1);
        });

        // Event handler for the next button
        nextButton.addEventListener('click', function () {
            renderCalendar(1);
        });
    });
</script>

</body>
</html>
