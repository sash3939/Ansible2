# Домашнее задание к занятию 2 «Работа с Playbook»

## Подготовка к выполнению

1. * Необязательно. Изучите, что такое [ClickHouse](https://www.youtube.com/watch?v=fjTNS2zkeBs) и [Vector](https://www.youtube.com/watch?v=CgEhyffisLY).
     Ознакомился
2. Создайте свой публичный репозиторий на GitHub с произвольным именем или используйте старый.
   Создал
3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.
   Поместил
4. Подготовьте хосты в соответствии с группами из предподготовленного playbook.
   Тут нужно было указать каким методом! Их много, но метод с докером не работает. Потрачено уйма времени!  

## Основная часть

1. Подготовлен inventory-файл `prod.yml`.
    Заранее были развернуты ВМ с помощью terraform в ЯО. И на них уже будет устанавливаться clickhouse и vector
   
    <img width="490" alt="task1" src="https://github.com/user-attachments/assets/bb726d20-0655-4132-9c70-0188df2ce33c">

2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev). Конфигурация vector должна деплоиться через template файл jinja2. От вас не требуется использовать все возможности шаблонизатора, просто вставьте стандартный конфиг в template файл. Информация по шаблонам по [ссылке](https://www.dmosk.ru/instruktions.php?object=ansible-nginx-install). не забудьте сделать handler на перезапуск vector в случае изменения конфигурации!

    Данный play устанавливает Vector. Сначала скачаивает пакет, устанавливает в выбранную директорию vector, применеяет шаблон jinja из template. Handler таска запускает службу (для этого сделан отдельный файл-шаблон vector.service.j2)
    <img width="605" alt="task2" src="https://github.com/user-attachments/assets/7f883633-6b9a-4c38-b2a7-20e5a1bfe53c">

    <img width="550" alt="task2-1" src="https://github.com/user-attachments/assets/de9a71ab-344e-454c-b138-8d126b95ab1e">

    <img width="577" alt="task2-2" src="https://github.com/user-attachments/assets/facdcdaf-1796-4079-bf0f-85ac3b2e778e">

    <img width="536" alt="task2-3" src="https://github.com/user-attachments/assets/5bad0cce-a4f1-4060-8f19-105d9939b5f1">
  
3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.  
4. Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить vector.
5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

   В процессе проверки найдена ошибка. Далее исправлена.
   
   <img width="541" alt="task5" src="https://github.com/user-attachments/assets/46d6e43e-a574-4dbe-9cb6-252ab83fcf9e">

7. Попробуйте запустить playbook на этом окружении с флагом `--check`.

Запускаем с ключом --check, пробный запуск, проверка на наличие ошибок перед запуском

<img width="823" alt="task6-1" src="https://github.com/user-attachments/assets/23413921-3524-4763-9a41-0c5b2045e402">

Устанавливаем clickhouse и vector

<img width="617" alt="task6" src="https://github.com/user-attachments/assets/8c18cd81-f2db-4d7a-81b3-a40e239b91dd">

9. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
10. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
11. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по [ссылке](https://github.com/opensearch-project/ansible-playbook). Так же приложите скриншоты выполнения заданий №5-8
12. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.
