<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
      <title></title>
      <meta name="generator" content="LibreOffice 7.3.7.2 (Linux)"/>
      <meta name="created" content="2023-04-21T12:27:19.195564888"/>
      <meta name="changed" content="2023-04-21T12:28:14.369685586"/>



<style type="text/css">

	body {
	   background-color: #FFF;
	   font-family: Arial;
	   font-size: 12px;
	}
	.table {
	   display: table;
	   border: 1px solid #40A1F5;
	}
	.table .th {
	   display: table-row;
	   background-color: #40A1F5;
	   color: #fff;
	   font-weight: bold;
	}
	.table .tr:nth-child(odd) {
	 background-color: #F9F9F9;
	}
	.table .tr{
	  display: table-row;
	  border-bottom: 1px solid #000;
	}
	.table .td {
	  display: table-cell;
	  padding: 15px;
	  border-bottom: 1px solid #40A1F5;
	}
	.table .tr:last-child .td{
	  border: 0;
	}
	.clear {
	  clear: both;
	}

</style>



   </head>
   <body lang="pt-BR" dir="ltr">

<!--
	<div class="table">
		<div class="th">
			<div class="td">SEQ</div>
			<div class="td">Nome completo do aluno</div>
			<div class="td">DtCadastro</div>
			<div class="td">QtdeRespostas</div>
			<div class="clear"></div>
		</div>
		<div class="tr">
			<div class="td">01</div>
			<div class="td">Shanid nome completo</div>
			<div class="td">shanid@shanid.com</div>
			<div class="td">444-555-666</div>
			<div style="clear: both;"></div>
		</div>
		<div class="tr">
			<div class="td">02</div>
			<div class="td">John</div>
			<div class="td">john@john.com</div>
			<div class="td">444-555-666</div>
			<div style="clear: both;"></div>
		</div>
	</div>
-->


<form action="relat.php">


    <br>
	<p align="center" style="margin-bottom: 0cm">
        <font face="Loma">
			 <font size="5" style="font-size: 12pt">
				 <u>Escolha um aluno abaixo para responder as perguntas ou digite o nome no campo aluno e pressione cadastrar p/inciair um novo questionário</u>
			 </font>
		</font>
    </p>
    <br>
    <br>

<?
$debug=$_SERVER["REMOTE_ADDR"]=='10.0.0.18';
//$debug=false;

//zzz. lista3<br><br>


// https://www.postgresqltutorial.com/postgresql-php/connect/
//$conn = pg_pconnect("host=10.0.10.2; dbname=creche; username=postgres; password=bi#pjePENTAHO");
// https://www.php.net/manual/en/function.pg-fetch-row.php

                $paramshost			= "172.19.0.2";
                $paramshost			= "10.0.10.2";
                $paramshost			= "172.18.0.2";
                $paramshost			= "172.18.0.2";
                $paramshost			= "172.19.0.2";
                $paramsport			= 5432;
                $paramsdatabase		= "creche";
                $paramsuser			= "postgres";
                $paramspassword		= "bi#pjePENTAHO";

        $conStr = sprintf("pgsql:host=%s;port=%d;dbname=%s;user=%s;password=%s", 
                $paramshost, 
                $paramsport, 
                $paramsdatabase, 
                $paramsuser, 
                $paramspassword);

//echo "[ $conStr ]<br><br>";

        $pdo = new \PDO($conStr);
        $pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

if (!$pdo) {
  echo "An error occurred.\n";
  echo $pdo;
  exit;
}

?>

	<div class="table">
		<div class="th">
			<div class="td">SEQ</div>
			<div class="td">Nome completo do aluno</div>
			<div class="td">DtCadastro</div>
			<div class="td">QtdeRespostas</div>
			<div class="clear"></div>
		</div>

<?
        $stmt = $pdo->query('SELECT a.*,to_char(a.dt_atualizacao,\'dd-mm-yyyy\') dt_cadastro,(select count(1) from relat.resp_aluno ra where id_aluno=a.id) qtde FROM relat.alunos a');
        while ($row = $stmt->fetch(\PDO::FETCH_ASSOC)) {
//			echo "<br><a href='relat.php?g=".$row['id']."'>".$row['nome']."</a><br>";
			echo "
		<div class=\"tr\">
			<div class=\"td\"><a href='relat.php?g=".$row['id']."'>".$row['id']					."</a></div>
			<div class=\"td\"><a href='relat.php?g=".$row['id']."'>".strtoupper($row['nome'])	."</a></div>
			<div class=\"td\"><a href='relat.php?g=".$row['id']."'>".$row['dt_cadastro']		."</a></div>
			<div class=\"td\"><a href='relat.php?g=".$row['id']."'>".$row['qtde']				."</a></div>
			<div style=\"clear: both;\"></div>
		</div>
";

        }

?> 
		</div>
	</div>


<br><br>
Escolha um aluno da lista acima ou digite um novo:<br>
<input type=value name=nome_aluno placeholder="Digite novo aluno" size=50>

<br><br>
<input type=submit value="cadastrar">


</form>




   </body>
</html>



