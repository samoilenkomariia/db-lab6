# Запити зацікавлених осіб

## Вступ

*[Вступ повинен містити короткий огляд всього документу.]*

### Мета 

*[Визначення мети цієї сукупності вимог. Зазвичай такою метою є створення та впровадження 
 інформаційної системи відповідного призначення.]*

### Контекст

*[Короткий опис того, з якими проектами пов'язаний цей документ, на що він впливає.]*


### Основні визначення та скорочення

*[Розділ містить визначення всіх термінів та скорочень, необхідних для правильного
тлумачення вимог. Можна зробити посилання на документ, в якому поданий аналіз предметної області.]*


### Посилання

*[Розділ містить повний список всіх документів, про які згадується.]*


## Короткий зміст

*[Розділ містить опис того, про що йдеться в еій частині цього документу, що залишилася. 
Також тут описана структура документу.]*

## Характеристика ділових процесів

Задля проєктування та розробки доцільної системи, необхідно чітко визначити фактори всіх бізнес-сценаріїв та їхню взаємодію з системою.  

**Бізнес-актори** (зовнішнє середовище бізнесу) - це суб’єкти, які впливають на бізнес, але не є його частиною. Вони взаємодіють із бізнесом ззовні та можуть прямо або опосередковано впливати на прийняття рішень та операційні процеси.  

**_Бізнес-актором_** є **клієнт(замовник)** — особа, що купує товари або послуги бізнесу. Саме клієнти визначають попит і впливають на продукт чи послугу своїми вимогами та очікуваннями.  

**Бізнес-робітники** (внутрішнє середовище бізнесу) - це люди, які безпосередньо працюють у межах організації, і їхня діяльність спрямована на досягнення її цілей.  

**_Бізнес-робітники:_**
- **Керівник команди** - особа, відповідальна за планування, координацію та контроль проєктів із використанням системи. Її роль полягає у забезпеченні ефективного використання ресурсів, керування командою розробників, дотримання термінів та якості та досягнення результатів.
- **Працівник команди(розробник)** - робітник, який виконує конкретні завдання в рамках своїх обов’язків для досягнення цілей бізнесу.
- **Адміністратор системи** - це фахівець, відповідальний за коректну роботу конкретної системи або застосунку, стежить за його стабільністю, оновленням, безпекою та доступністю для користувачів, слідкує за дотриманням правил використання користувачами.

*[В цьому розділі визначаються зовнішні фактори, що впливають на бізнес (бізнес-актори), 
та внутрішні фактори (робітники), дається загальна характеристика діяльності бізнес-акторів 
та робітників, яка здійснюється за допомогою бізнесу.*
*Дається опис бізнес-сценаріїв взаємодії бізнес-акторів, робітників і, можливо, інформаційної системи за допомогою наступної
специфікації:*

   
***ID:***
    
***НАЗВА:***
    
***УЧАСНИКИ:***

***ПЕРЕДУМОВИ:***

***РЕЗУЛЬТАТ:***

***ВИКЛЮЧНІ СИТУАЦІЇ:***

***ОСНОВНИЙ СЦЕНАРІЙ:***

*Кількість сценаріїв визначається у відповідності до специфіки завдання та необхідного 
рівня деталізації (зазвичай, 5-6 сценаріїв).*

## Короткий огляд продукту

*[Визначається границя системи та категорії її користувачів. Дається загальна характеристика категорій користувачів
системи]*


| ID | <span id=FilterTasks>`FilterTasks`</span> |
| :--- | :--- |
| Назва: | Відфільтрувати завдання |
| Учасники: | Користувач (керівник команди, працівник команди), система |
| Передумови: | - Користувач авторизований <br> |
| Результат: | Перелік завдань, відібраних за обраними фільтрами  |
| Виключні ситуації: | - <font color="red">InvalidDataException</font>: Користувач ввів некоректні дані |
| Основний сценарій: | 1. Користувач відкриває проєкт <br> 2. Система перенаправляє користувача на сторінку проєкту <br> 3. Користувач натискає кнопку "Фільтри" <br> 4. Система відображає меню для обирання фільтрів <br> 5. Користувач обирає фільтри (може виникнути <font color="red">InvalidDataException</font>) <br> 6. Користувач натискає кнопку "Застосувати" <br> 7. Система відображає перелік завдань, відібраних за обраними фільтрами |

| ID | <span id=BlockProject>`BlockProject`</span> |
| :--- | :--- |
| Назва: | Заблокувати проєкт |
| Учасники: | Адміністратор системи, система |
| Передумови: | - Адміністратор системи авторизований <br> - Проєкт активний <br> - Проєкт порушує умови використання |
| Результат: | Проєкт заблоковано |
| Виключні ситуації: | - <font color="red">CancelException</font>: Адміністратор скасував операцію блокування |
| Основний сценарій: | 1. Адміністратор відкриває проєкт <br> 2. Система перенаправляє адміністратора на сторінку проєкту <br> 3. Адміністратор натискає кнопку "Керування проєктом" <br> 4. Система перенаправляє адміністратора на сторінку керування проєктом <br> 5. Адміністратор натискає кнопку "Заблокувати" <br> 6. Система відображає вікно зі спадним меню вибору причини блокування та кнопками "Скасувати" і "Заблокувати" <br> 7. Адміністратор обирає причину блокування та натискає кнопку "Заблокувати" (може виникнути <font color="red">CancelException</font>) <br> 8. Система змінює стан проєкту на "Заблокований" <br> 9. Система сповіщає адміністратора про блокування проєкту |

| ID | <span id=UnblockProject>`UnblockProject`</span> |
| :--- | :--- |
| Назва: | Розблокувати проєкт |
| Учасники: | Адміністратор системи, система |
| Передумови: | - Адміністратор системи авторизований <br> - Адміністратор системи відкрив проєкт <br> - Проєкт заблокований |
| Результат: | Проєкт розблоковано |
| Виключні ситуації: | - <font color="red">CancelException</font>: Адміністратор скасував операцію розблокування |
| Основний сценарій: | 1. Адміністратор відкриває проєкт <br> 2. Система перенаправляє адміністратора на сторінку проєкту <br> 3. Адміністратор натискає кнопку "Керування проєктом" <br> 4. Система перенаправляє адміністратора на сторінку керування проєктом <br> 5. Адміністратор натискає кнопку "Розблокувати" <br> 6. Система відображає вікно з "Скасувати" і "Розблокувати" <br> 7. Адміністратор натискає кнопку "Розблокувати" (може виникнути <font color="red">CancelException</font>) <br> 8. Система змінює стан проєкту на "Розблокований" <br> 9. Система сповіщає адміністратора про розблокування проєкту |

| ID | <span id=BanUser>`BanUser`</span> |
| :--- | :--- |
| Назва: | Заблокувати користувача |
| Учасники: | Адміністратор системи, система |
| Передумови: | - Адміністратор системи авторизований <br> - Обліковий запис користувача активний <br> - Користувач порушує умови використання|
| Результат: | Користувача заблоковано |
| Виключні ситуації: | - <font color="red">CancelException</font>: Адміністратор скасував операцію блокування |
| Основний сценарій: | 1. Адміністратор відкриває перелік користувачів системи <br> 2. Система перенаправляє адміністратора на сторінку переліку користувачів системи <br> 3. Адміністратор натискає кнопку меню дій над користувачем <br> 4. Система відображає меню дій над користувачем <br> 5. Адміністратор натискає кнопку "Заблокувати" <br> 6. Система відображає вікно зі спадним меню вибору причини блокування та кнопками "Скасувати" і "Заблокувати" <br> 7. Адміністратор натискає кнопку "Заблокувати" (може виникнути <font color="red">CancelException</font>) <br> 8. Система змінює стан облікового запису користувача на "Заблокований" <br> 9. Система сповіщає адміністратора про блокування користувача |

| ID | <span id=UnbanUser>`UnbanUser`</span> |
| :--- | :--- |
| Назва: | Розблокувати користувача |
| Учасники: | Адміністратор системи, система |
| Передумови: | - Адміністратор системи авторизований <br> - Обліковий запис користувача заблокований |
| Результат: | Користувача розблоковано |
| Виключні ситуації: | - <font color="red">CancelException</font>: Адміністратор скасував операцію розблокування |
| Основний сценарій: | 1. Адміністратор відкриває перелік користувачів системи <br> 2. Система перенаправляє адміністратора на сторінку переліку користувачів системи <br> 3. Адміністратор натискає кнопку меню дій над користувачем <br> 4. Система відображає меню дій над користувачем <br> 5. Адміністратор натискає кнопку "Розблокувати" <br> 6. Система відображає вікно з кнопками "Скасувати" і "Розблокувати" <br> 7. Адміністратор натискає кнопку "Розблокувати" (може виникнути <font color="red">CancelException</font>) <br> 8. Система змінює стан облікового запису користувача на "Активний" <br> 9. Система сповіщає адміністратора про розблокування користувача |

| ID | <span id=UnbanUser>`UserSupport`</span> |
| :--- | :--- |
| Назва: | Отримати користувацьку підтримку |
| Учасники: | Користувач (керівник команди, працівник команди), адміністратор системи, система |
| Передумови: | - Користувач авторизований <br> - Користувач хоче звернутися до користувацької підтримки |
| Результат: | Звернення користувача оброблене |
| Виключні ситуації: | - <font color="red">InvalidDataException</font>: користувач ввів некоректні дані <br> - <font color="red">InvalidFileFormatException</font>: користувач приклав файл з некоректним розширенням |
| Основний сценарій: | 1. Користувач натискає на кнопку "Користувацька підтримка" <br> 2. Система перенаправляє користувача на сторінку створення звернення <br> 5. Користувач вводить тему, опис звернення та свою електронну адресу (може виникнути <font color="red">InvalidDataException</font>), за потреби прикладає зображення (може виникнути <font color="red">InvalidFileFormatException</font>) <br> 6. Система надсилає звернення на електронну адресу адміністратора <br> 7. Система сповіщає користувача про створення звернення <br> 8. Адміністратор оброблює звернення користувача |

## Функціональність

Функціональні вимоги є важливою частиною розробки будь-якої системи, оскільки саме вони визначають основні задачі, які система повинна виконувати для ефективного управління проєктами. Це специфікації, які описують, що система повинна робити для досягнення своїх цілей. Вони визначають, які операції, задачі або послуги повинна виконувати система для користувачів і як вона повинна поводитися в різних сценаріях використання. У нашій системі вони представлені у вигляді інтерфейсів для кожної категорії користувачів.

### Інтерфейс працівника  
Звичайний достатній набір можливостей для роботи розробника.  
- стоврити обліковий запис
- видалити обліковий запис
- увійти в обліковий запис
- вийти з облікового запису
- редагувати профіль користувача(змінити ім'я, контактні дані, аватар)
- редагувати завдання(прикріпити файл, прокоментувати, змінити статус)
- відфільтрувати завдання за певним критерієм(статус, виконавець, пріоритет, дедлайн)

### Інтерфейс керівника проєкту
Розширений набір інструментів, який дозволяє керувати проєктами.
- створити проєкт
- видалити проєкт
- редагувати проєкт
- додати користувача до проєкту
- видалити користувача
- створити завдання
- видалити завдання
- призначити виконавця до завдання
- поставити дедлайн

### Інтерфейс адміністратора системи
Найбільший інвентар можливостей, які дозволяють виконувати обов'язки адміністартора.
- переглядати недавні дії користувачів
- заблокувати користувача
- розблокувати користувача
- заблокувати проєкт
- розблокувати проєкт
- отримати повідомлення від користувасчів та вирішити їхні проблеми

## Практичність

*[Usability (вимоги до зручності роботи)]*

## Надійність

*[Reliability (вимоги до надійності)]*

## Продуктивність

*[Performance (вимоги до продуктивності)]*

## Експлуатаційна придатність

*[Supportability (вимоги до підтримки)]*