/* Практическое задание #2 по теме “Управление БД”. */

/* Задание # 2.
* Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, 
числового id и строкового name
*/
/* создание базы данных example (если БД существует, эту команду надо закоментировать или 
удалить БД перед ее созданием командой DROP DATABASE IF EXISTS example; иначе,
при повторном выполнении скрипта получим ошибку
Error Code: 1007. Can't create database 'example'; database exists)
*/
drop database if exists example;
create database example;
-- выбераем БД по умолчанию
USE example;
-- если таблица существует, удаляем ее (в уроке эта команда есть в примере)
drop table if exists users;
-- создание таблицы users
create table users (id SERIAL, name VARCHAR(100) NOT NULL);
