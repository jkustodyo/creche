
-- https://www.treinaweb.com.br/blog/como-instalar-um-pacote-com-composer-e-utiliza-lo-em-seu-projeto-php


--CREATE database creche;
--CREATE SCHEMA relat AUTHORIZATION postgres;

DROP TABLE if exists relat.alunos;
CREATE TABLE relat.alunos (
	id int4 NOT NULL,
	dt_atualizacao timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ds_conteudo text NULL
,	nome varchar(500) not null
--,foto cblob
);CREATE UNIQUE INDEX alunos_idx1 ON relat.alunos USING btree (id);

DROP TABLE if exists relat.aspectos;
CREATE TABLE relat.aspectos (
	id int4 NOT NULL,
	dt_atualizacao timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
,	nome varchar(500) not null
--,foto cblob
);CREATE UNIQUE INDEX aspectos_idx1 ON relat.aspectos USING btree (id);

DROP TABLE if exists relat.perguntas;
CREATE TABLE relat.perguntas (
	id int4 NOT NULL,
	id_aspecto int4 NOT NULL,
	dt_atualizacao timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
,	nome varchar(500) not null
,multi_escolha char(1)
--,foto cblob
);CREATE UNIQUE INDEX perguntas_idx1 ON relat.perguntas USING btree (id);

/*
DROP TABLE if exists relat.aspecto_pergunta;
CREATE TABLE relat.aspecto_pergunta (
	id int4 NOT NULL,
	dt_atualizacao timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
,	nome varchar(500) not null
--,foto cblob
);CREATE UNIQUE INDEX aspecto_pergunta_idx1 ON relat.aspecto_pergunta USING btree (id);
*/


DROP TABLE if exists relat.resp_pergunta;
CREATE TABLE relat.resp_pergunta (
	id int4 NOT NULL,
	id_pergunta int4 NOT NULL,
	dt_atualizacao timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
,	nome varchar(500) not null
--,foto cblob
);CREATE UNIQUE INDEX resp_pergunta_idx1 ON relat.resp_pergunta USING btree (id);


DROP TABLE if exists relat.resp_aluno;
CREATE TABLE relat.resp_aluno (
	id int4 NOT NULL,
	id_aluno int4 NOT NULL,
	id_resp_pergunta int4 NOT NULL,
	dt_atualizacao timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
--,	nome varchar(500) not null
--,foto cblob
);CREATE UNIQUE INDEX resp_aluno_idx1 ON relat.resp_aluno USING btree (id);


--SELECT * FROM relat.resp_aluno where id_resp_pergunta=3 and id_aluno=2


insert into relat.resp_aluno values (1,2,3);
insert into relat.resp_aluno values (2,1,3);
insert into relat.resp_aluno values (3,1,6);
insert into relat.resp_aluno values (4,1,9);
insert into relat.resp_aluno values (5,1,13);
insert into relat.resp_aluno values (6,2,5);

insert into relat.alunos (id,nome) values (1,'denise');
insert into relat.alunos (id,nome) values (2,'leticia');
insert into relat.alunos (id,nome) values (3,'eric');
insert into relat.alunos (id,nome) values (4,'teste');

insert into relat.aspectos (id,nome) values (1,'ASPECTO SOCIOEMOCIONAL');
insert into relat.aspectos (id,nome) values (2,'ASPECTO COGNITIVO/ pedagógico');
insert into relat.aspectos (id,nome) values (3,'ASPECTO PSICOMOTOR');

insert into relat.perguntas (id,id_aspecto,nome) values (1,1,'Como foi a adaptação ao ambiente escolar?');
insert into relat.perguntas (id,id_aspecto,nome) values (2,1,'Como relaciona-se com os colegas, professora nas diversas situações  do dia a dia?');
insert into relat.perguntas (id,id_aspecto,nome) values (3,1,'Como participa das brincadeiras?');
insert into relat.perguntas (id,id_aspecto,nome) values (4,1,'Como é a participação e realização das atividades do projeto “Meu quintal é maior que o mundo “pela criança?');


insert into relat.resp_pergunta (id,id_pergunta,nome) values (1,1,'Em seu processo de adaptação ao ambiente escolar, apresentou período inicial de choro e resistência para permanecer no espaço escolar, necessitando de acalanto por parte das educadoras.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (2,1,'No que se refere à adaptação ao ambiente escolar, adaptou-se com facilidade, estabelecendo novos relacionamentos.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (3,1,'No que se refere à adaptação ao ambiente escolar, apresentou ansiedade quanto a espera pela saída da escola, chamando pela mãe.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (4,1,'No que se refere à adaptação ao ambiente escolar, mostrou-se choroso na hora da entrada, Mas o choro cessava no decorrer da rotina.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (5,1,'No que se refere à adaptação ao ambiente escolar, mostrou-se seguro e bem no espaço escolar.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (6,1,'No que se refere à adaptação ao ambiente escolar,  não apresentou dificuldades no processo de conhecer e estabelecer novos vínculos.');

insert into relat.resp_pergunta (id,id_pergunta,nome) values (7,2,'Relaciona-se de forma conflituosa com colegas, havendo por vezes desrespeito às regras de convivência.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (8,2,'Relaciona-se de forma harmoniosa com colegas, educadores e funcionários, respeitando as regras de convivência do ambiente escolar.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (9,2,'Busca apoio de um adulto sempre que necessita.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (10,2,'Coopera com os colegas e educadoras.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (11,2,'Compartilha seus brinquedos e materiais com os colegas.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (12,2,'Reage com birras e choros insistentes ao ser contrariado.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (13,2,'A criança aceita e compreende as  proibições e negações do adulto.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (14,2,'Reage com indiferença e persistência diante de proibições e negações do adulto.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (15,2,'Nem sempre se mostra disposto a interagir com o grupo, preferindo momentos de quietude e privacidade.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (16,2,'Demonstra dificuldades/ desinteresse em integrar-se  às brincadeiras dos grupos.');


insert into relat.resp_pergunta (id,id_pergunta,nome) values (17,3,'Participa das brincadeiras de maneira amistosa.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (18,3,'Precisa de intervenções em alguns momentos para compartilhar brinquedos.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (19,3,'Respeita combinados do grupo.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (20,3,'Relaciona-se com o brinquedo de forma cuidadosa e prazerosa, envolvendo-se em ações de exploração e criação com os objetos.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (21,3,'Brinca de forma autônoma com brinquedos que exigem a repetição de uma mesma ação com o objeto, sendo capaz de encaixar e ou empilhar.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (22,3,'Utiliza funcionalmente os brinquedos, adequando seu comportamento  as qualidades/ características dos objetos: agitar o chocalho, bater martelo, rolar ou chutar a bolsa, empilhar blocos.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (23,3,'Tem dificuldades em respeitar combinados do grupo.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (24,3,'Na solução de conflitos demonstra insegurança.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (25,3,'Evidencia atitude positiva diante das  brincadeiras propostas e na divisão de brinquedos.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (26,3,'Demonstra desinteresse em participar das brincadeiras em grupo, preferindo brincar de forma isolada.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (27,3,'A criança cria brincadeiras de faz-de-conta e convida seus pares para participar.');

insert into relat.resp_pergunta (id,id_pergunta,nome) values (28,4,'Quanto à participação e realização das atividades do projeto “Meu quintal é maior que o mundo”, tem interesse pelas atividades propostas e participa ativamente.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (29,4,'Quanto à participação e realização das atividades do projeto “Meu quintal é maior que o mundo”, demonstra insegurança, solicitando ajuda da professora.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (30,4,'Quanto à participação e realização das atividades do projeto “Meu quintal é maior que o mundo”, realiza as atividades com criatividade e dedicação.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (31,4,'Quanto à participação e realização das atividades do projeto “Meu quintal é maior que o mundo”, concentra-se na realização das tarefas.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (32,4,'Quanto à participação e realização das atividades do projeto “Meu quintal é maior que o mundo”, sente-se orgulhosa do que consegue fazer.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (33,4,'Quanto à participação e realização das atividades do projeto “Meu quintal é maior que o mundo”, resiste a participar de algumas atividades.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (34,4,'Quanto à participação e realização das atividades do projeto “Meu quintal é maior que o mundo”, participa timidamente das atividades em sala.');




insert into relat.perguntas (id,id_aspecto,nome) values (5,2,'Desenvolvimento da linguagem');
insert into relat.perguntas (id,id_aspecto,nome) values (6,2,'Com relação ao desenvolvimento e ampliação das capacidades de comunicação e expressão');
insert into relat.perguntas (id,id_aspecto,nome) values (7,2,'Interessa-se principalmente pelas atividades de ');
insert into relat.perguntas (id,id_aspecto,nome) values (8,2,'Sobre atitudes de cuidado e organização');
insert into relat.perguntas (id,id_aspecto,nome) values (9,2,'Nas atividades que envolvem música');
insert into relat.perguntas (id,id_aspecto,nome) values (10,2,'Nas produções artísticas');


insert into relat.resp_pergunta (id,id_pergunta,nome) values (35,5,'No que se refere ao desenvolvimento da linguagem, aprecia ouvir histórias.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (36,5,'No que se refere ao desenvolvimento da linguagem, reconta histórias ao seu modo.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (37,5,'No que se refere ao desenvolvimento da linguagem, compreende instruções recebidas.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (38,5,'No que se refere ao desenvolvimento da linguagem, manifesta suas preferências, seus desejos e desagrados de forma clara.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (39,5,'No que se refere ao desenvolvimento da linguagem, participa da roda de conversa.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (40,5,'No que se refere ao desenvolvimento da linguagem, identifica seu nome quando chamado.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (41,5,'No que se refere ao desenvolvimento da linguagem, conhece os amigos pelo nome.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (42,5,'No que se refere ao desenvolvimento da linguagem, expressa-se através de frases completas.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (43,5,'No que se refere ao desenvolvimento da linguagem, expressa ideias com clareza.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (44,5,'No que se refere ao desenvolvimento da linguagem, expressa seus desejos e necessidades através do choro.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (45,5,'No que se refere ao desenvolvimento da linguagem,  acompanha cantigas.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (46,5,'No que se refere ao desenvolvimento da linguagem, manifesta interesse em manusear livros, revistas e materiais escritos.');

insert into relat.resp_pergunta (id,id_pergunta,nome) values (47,6,'Com relação ao desenvolvimento e ampliação das capacidades de comunicação e expressão, inicia e mantém diálogos.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (48,6,'Com relação ao desenvolvimento e ampliação das capacidades de comunicação e expressão, verbaliza pedidos e/ ou recusa.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (49,6,'Com relação ao desenvolvimento e ampliação das capacidades de comunicação e expressão, tem ainda insegurança em expressar seus desejos, anseios, e necessidades nas variadas situações diárias.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (50,6,'Com relação ao desenvolvimento e ampliação das capacidades de comunicação e expressão, houve desenvolvimento no processo de interação oral com seus pares.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (51,6,'Com relação ao desenvolvimento e ampliação das capacidades de comunicação e expressão, ainda há dificuldades na interação com os colegas.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (52,6,'Com relação ao desenvolvimento e ampliação das capacidades de comunicação e expressão, ouve atentamente e espera sua vez de falar.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (53,6,'Com relação ao desenvolvimento e ampliação das capacidades de comunicação e expressão, apresenta um vocabulário rico.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (54,6,'Com relação ao desenvolvimento e ampliação das capacidades de comunicação e expressão, participa de roda de conversa utilizando diferentes recursos para o diálogo.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (55,6,'Com relação ao desenvolvimento e ampliação das capacidades de comunicação e expressão, elabora perguntas com um repertório de palavras diversificado.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (56,6,'Com relação ao desenvolvimento e ampliação das capacidades de comunicação e expressão, busca oportunidades de interlocução oral.');

insert into relat.resp_pergunta (id,id_pergunta,nome) values (57,7,'Interessa-se principalmente pelas atividades de modelagem.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (58,7,'Interessa-se principalmente pelas atividades de roda de conversa e histórias.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (59,7,'Interessa-se principalmente pelas atividades de recorte.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (60,7,'Interessa-se principalmente pelas atividades de colagem.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (61,7,'Interessa-se principalmente pelas atividades de pintura.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (62,7,'Interessa-se principalmente pelas atividades de materiais não –estruturados.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (63,7,'Interessa-se principalmente pelas atividades de desenho/grafismo/escrita.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (64,7,'Interessa-se principalmente pelas atividades de escrita.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (65,7,'Interessa-se principalmente pelas atividades de recreação/ar livre.');

insert into relat.resp_pergunta (id,id_pergunta,nome) values (66,8,'Sobre atitudes de cuidado e organização, apresenta cuidado com seus objetos pessoais e de uso coletivo.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (67,8,'Sobre atitudes de cuidado e organização, com os objetos de uso pessoal: arruma-os, guarda-os em locais a eles destinados.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (68,8,'Sobre atitudes de cuidado e organização, necessita de orientações de adulto quanto ao zelo pelos materiais de uso pessoal e coletivo.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (69,8,'Sobre atitudes de cuidado e organização, ajuda a manter o ambiente da sala organizado e limpo.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (70,8,'Sobre atitudes de cuidado e organização, demonstra atitudes de cuidados e organização com o espaço escolar.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (71,8,'Sobre atitudes de cuidado e organização, não gosta de cooperar na arrumação da sala / brinquedos.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (72,8,'Sobre atitudes de cuidado e organização, coopera nos momentos de arrumação dos brinquedos.');

insert into relat.resp_pergunta (id,id_pergunta,nome) values (73,9,'Nas atividades que envolvem música, gosta de ouvir música, cantar e dançar.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (74,9,'Nas atividades que envolvem música, evidencia capacidade de imitação, de criação e de memorização musical.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (75,9,'Nas atividades que envolvem música, ouve com atenção.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (76,9,'Nas atividades que envolvem música, acompanha as cantigas com gestos ritmados.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (77,9,'Nas atividades que envolvem música, aprecia confeccionar materiais sonoros.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (78,9,'Nas atividades que envolvem música, participa com desenvoltura das brincadeiras cantadas, respondendo aos estímulos.');

insert into relat.resp_pergunta (id,id_pergunta,nome) values (79,10,'Nas produções artísticas, gosta de desenhar.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (80,10,'Nas produções artísticas, admira suas produções.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (81,10,'Nas produções artísticas, interessa-se por diversos recursos artísticos.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (82,10,'Nas produções artísticas, manuseia a massa de modelar com criatividade.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (83,10,'Nas produções artísticas, participa de jogos dramatizados assumindo diferentes papéis.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (84,10,'Nas produções artísticas, aprecia brincadeiras de faz de conta.');




insert into relat.perguntas (id,id_aspecto,nome) values (11,3,'Demonstra Firmeza, equilíbrio e facilidade ao');
insert into relat.perguntas (id,id_aspecto,nome) values (12,3,'Nas atividades que envolvem movimento, a criança');
insert into relat.perguntas (id,id_aspecto,nome) values (13,3,'Com relação à formação da identidade e desenvolvimento da independência e autonomia, a criança');
insert into relat.perguntas (id,id_aspecto,nome) values (14,3,'Com relação ao desenvolvimento e ampliação dos conhecimentos sobre o meio físico e natural');
insert into relat.perguntas (id,id_aspecto,nome) values (15,3,'Acerca da compreensão e assimilação da rotina escolar');


insert into relat.resp_pergunta (id,id_pergunta,nome) values (85,11,'Quanto ao aspecto psicomotor, demonstra firmeza, equilíbrio e facilidade ao caminhar, anda bem sozinho.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (86,11,'Quanto ao aspecto psicomotor, demonstra firmeza, equilíbrio e facilidade ao correr.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (87,11,'Quanto ao aspecto psicomotor, demonstra firmeza, equilíbrio e facilidade ao pular de diversas maneiras.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (88,11,'Quanto ao aspecto psicomotor, demonstra firmeza, equilíbrio e facilidade ao andar coordenadamente em atividades variadas.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (89,11,'Quanto ao aspecto psicomotor, demonstra firmeza, equilíbrio e facilidade ao acompanhar ritmos.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (90,11,'Quanto ao aspecto psicomotor, demonstra firmeza, equilíbrio e facilidade ao rasgar e amassar papel.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (91,11,'Quanto ao aspecto psicomotor, demonstra firmeza, equilíbrio e facilidade ao brincar.');

insert into relat.resp_pergunta (id,id_pergunta,nome) values (92,12,'Nas atividades que envolvem movimento, a criança está em desenvolvimento de suas habilidades motoras, necessitando de estímulos motores.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (93,12,'Nas atividades que envolvem movimento, a criança não se interessa e busca outras atividades.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (94,12,'Nas atividades que envolvem movimento, a criança costuma cair com frequência.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (95,12,'Nas atividades que envolvem movimento, a criança sente-se insegura e evita essas atividades .');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (96,12,'Nas atividades que envolvem movimento, a criança participa de ambientes desafiadores que envolvem movimentos e situações de interações.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (97,12,'Nas atividades que envolvem movimento, a criança acompanha musicas com gestos e ritmos corporais .');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (98,12,'Nas atividades que envolvem movimento, a criança desloca-se no espaço com destreza e sem ajuda.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (99,12,'Nas atividades que envolvem movimento, a criança é capaz de coordenar sua ação com a do colega.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (100,12,'Nas atividades que envolvem movimento, a criança demonstra confiança em suas possibilidades de ação e movimento.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (101,12,'A criança movimenta-se durante as brincadeiras ao ar livre : corre, pula, arrasta-se e pendura –se, ampliando gradualmente o controle do próprio corpo.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (102,12,'Nas atividades que envolvem movimento, a criança participa com alegria.');

insert into relat.resp_pergunta (id,id_pergunta,nome) values (103,13,'Com relação à formação da identidade e desenvolvimento da independência e autonomia, a criança apresenta uma imagem positiva de si.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (104,13,'Com relação à formação da identidade e desenvolvimento da independência e autonomia, a criança é independente.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (105,13,'Com relação à formação da identidade e desenvolvimento da independência e autonomia, a criança realiza suas atividades com confiança.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (106,13,'Com relação à formação da identidade e desenvolvimento da independência e autonomia, a criança estabeleceu laços afetivos com os colegas de grupo e adultos da escola.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (107,13,'Com relação à formação da identidade e desenvolvimento da independência e autonomia, a criança desenvolveu atitudes de ajuda e cooperação.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (108,13,'Com relação à formação da identidade e desenvolvimento da independência e autonomia, a criança evidencia atitudes de respeito e interesse pelas manifestações culturais desenvolvidas na escola.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (109,13,'Com relação à formação da identidade e desenvolvimento da independência e autonomia, a criança valoriza suas características físicas.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (110,13,'Com relação à formação da identidade e desenvolvimento da independência e autonomia, a criança tem percepção de suas capacidades.');

insert into relat.resp_pergunta (id,id_pergunta,nome) values (111,14,'Com relação ao desenvolvimento e ampliação dos conhecimentos sobre o meio físico e natural, realiza tentativas para compreender as coisas e os acontecimentos a sua volta.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (112,14,'Com relação ao desenvolvimento e ampliação dos conhecimentos sobre o meio físico e natural, demonstra interesse em aprender sobre seu bairro, sua cidade o mundo, a cultura e a natureza.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (113,14,'Com relação ao desenvolvimento e ampliação dos conhecimentos sobre o meio físico e natural, reconhece partes do corpo e percebe suas funções.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (114,14,'Com relação ao desenvolvimento e ampliação dos conhecimentos sobre o meio físico e natural, identifica os elementos de sua família.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (115,14,'Com relação ao desenvolvimento e ampliação dos conhecimentos sobre o meio físico e natural, desenvolveu hábitos de e atitudes de higiene com o ambiente e seu corpo.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (116,14,'Com relação ao desenvolvimento e ampliação dos conhecimentos sobre o meio físico e natural, gosta de observar as plantas, a chuva, o vento, os animais e tem curiosidades.');

insert into relat.resp_pergunta (id,id_pergunta,nome) values (117,15,'Acerca da compreensão e assimilação da rotina escolar, a criança mostra conhecimento acerca da sequência das atividades do dia a dia.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (118,15,'Acerca da compreensão e assimilação da rotina escolar, a criança consegue se organizar antecipadamente às atividades, avisando ou preparando-se sem aviso prévio.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (119,15,'Acerca da compreensão e assimilação da rotina escolar, a criança está em processo de compreensão da rotina, agindo de acordo com os comandos.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (120,15,'Acerca da compreensão e assimilação da rotina escolar, a criança resiste a mudanças na rotina.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (121,15,'Acerca da compreensão e assimilação da rotina escolar, a criança apresenta dificuldades em mudar de atividades, precisando de ajuda do adulto.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (122,15,'Nos momentos de cuidados pessoais e higiene a criança age com autonomia: põe a mão debaixo de água corrente e esfrega, seca as mãos com papel toalha, põe a escova de dentes na boca e faz os movimentos de escovação, despe a roupa ou veste-se sozinha.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (123,15,'Nos momentos de cuidados e higiene, a criança age após comandos e solicitações das educadoras.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (124,15,'Nos momentos de cuidados e higiene, a criança participa e coopera em todos os passos de lavagem de mãos, na escovação dos dentes e cabelo, no banho e na hora de vestir-se e despir-se.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (125,15,'Durante a alimentação, percebe-se aceitação dos diversos alimentos oferecidos neste novo espaço com cheiros, sabores e temperos diferentes do seu ambiente doméstico.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (126,15,'A criança aceita facilmente o cardápio oferecido pela creche, demonstrando prazer ao participar de todos os momentos de refeição: desjejum, almoço, lanche e jantar.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (127,15,'A criança está em processo de aceitação do cardápio oferecido na creche, alternando entre aceitação e recusa das refeições, nem sempre comendo o alimento integralmente ');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (128,15,'Nos momentos de alimentação, a criança apresenta preferência por alguns alimentos, ou itens do cardápio, rejeitando os demais.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (129,15,'Durante as refeições, a criança apresenta atitudes compatíveis à seletividade alimentar, aceitando um número reduzido e específico de alimentos .');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (130,15,'A criança utiliza o talher com segurança e independência para se alimentar, sem precisar de auxílio do adulto.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (131,15,'A criança está em processo de independência para se alimentar, ainda precisando de auxílio do adulto.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (132,15,'Na hora do descanso, a criança dorme rotineiramente numa cama individualizada, sem a presença de um adulto.');
insert into relat.resp_pergunta (id,id_pergunta,nome) values (133,15,'Na hora do descanso, a criança dorme com a presença de um adulto precisando de aca');






select * from relat.resp_aluno ra 
order by dt_atualizacao desc;

select * from relat.alunos;


