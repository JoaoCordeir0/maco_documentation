use maco;

insert into course (name, description, image) values ('Engenharia de software', 'Curso de tecnologia', 'curso_eng_soft.jpg');
insert into course (name, description, image) values ('Administração', 'Curso de gerencia', 'curso_adm.jpg');
insert into course (name, description, image) values ('Fisioterapia', 'Curso da área da saúde', 'curso_fisio.jpg');

insert into role (description) values ('Admin');
insert into role (description) values ('Advisor');
insert into role (description) values ('Author');

insert into user (name, cpf, email, ra, password, role, status)                   	     -- 1234
values ('João Victor Cordeiro', '00123456789', 'joaocordeiro2134@gmail.com', '27099-5', '$2a$12$9XY0RUUz34o7006K4aC8z.1SSnmPDwNiGZkUO7u2BMndxA1tutxH6', 1, 1);
insert into user (name, cpf, email, ra, password, role, status)			     -- 1234
values ('Henrique Magnoli', '12345678900', 'henrique@gmail.com', '21239-5', '$2a$12$9XY0RUUz34o7006K4aC8z.1SSnmPDwNiGZkUO7u2BMndxA1tutxH6', 2, 1);

insert into article_status (name, description) values ('Recebido', 'Estado inicial do artigo, quando o autor envia');

insert into article (user, course, title, authors, advisors, keywords, summary, status)
values (1, 1, 'Artigo de teste 1', 'João - joaocordeiro2134@gmail.com', 'Revisor teste', 'teste;teste;teste', 'Lorem ipsum', 1);
insert into article (user, course, title, authors, advisors, keywords, summary, status)
values (1, 1, 'Artigo de teste 2', 'Cordeiro - joaocordeiro2134@gmail.com', 'Revisor teste', 'teste;teste;teste', 'Lorem ipsum', 1);
insert into article (user, course, title, authors, advisors, keywords, summary, status)
values (1, 3, 'Artigo fisio', 'Henrique - henrique@gmail.com', 'Revisor teste', 'teste;teste;teste', 'Lorem ipsum', 1);

insert into user_course(user, course)
values (1, 1), (2, 3);

insert into event (name, start, end, number_characters, number_keywords, instructions, status) values 
('Evento de teste', '2023-03-29 00:00:00', '2023-05-29 00:00:00', 500, 5, '', 1),
('Jornada científica UNIFAE 2024', '2024-03-29 00:00:00', '2024-05-29 00:00:00', 500, 5, '', 1)