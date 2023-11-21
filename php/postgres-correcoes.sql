



select tpe.id_processo,replace(replace(replace(tpdi.nr_documento_identificacao,'-',''),'/',''),'.','') doc
from core.tb_processo_evento tpe 
join client.tb_processo_parte tpp on tpp.id_processo_trf=tpe.id_processo 
join client.tb_pess_doc_identificacao tpdi on tpdi.id_pessoa=tpp.id_pessoa 
where to_char(tpe.dt_atualizacao,'yyyy-mm')='2021-08'
and tpdi.cd_tp_documento_identificacao='CPJ'




/*

select tpdi.cd_tp_documento_identificacao,count(1)
from core.tb_processo_evento tpe 
join client.tb_processo_parte tpp on tpp.id_processo_trf=tpe.id_processo 
join client.tb_pess_doc_identificacao tpdi on tpdi.id_pessoa=tpp.id_pessoa 
where to_char(tpe.dt_atualizacao,'yyyy-mm')='2021-08'
group by 1
order by 2 desc





create role rs_pje_gerente;

create schema criminal;
create schema client;
create schema core;
create schema acl;
create schema jt;


-- apos criar objetos
GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA public,acl,criminal,core,client,jt TO rs_pje_gerente;
GRANT USAGE,SELECT,UPDATE ON ALL SEQUENCES IN SCHEMA public,acl,criminal,core,client,jt TO rs_pje_gerente;
GRANT USAGE ON SCHEMA public,acl,criminal,core,client,jt TO rs_pje_gerente;
GRANT CONNECT, TEMPORARY, TEMP ON DATABASE h1_pje TO rs_pje_gerente;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public,acl,criminal,core,client,jt TO rs_pje_gerente;
GRANT CREATE ON SCHEMA client TO rs_pje_gerente;


*/

