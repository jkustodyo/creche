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
			<div class="td">No</div>
			<div class="td">Aluno</div>
			<div class="td">DtCadastro</div>
			<div class="td">Responsáveis</div>
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
		<div class="tr">
			<div class="td">03</div>
			<div class="td">Roy</div>
			<div class="td">roy@roy.com</div>
			<div class="td">444-555-666</div>
			<div class="clear"></div>
		</div>
	</div>

-->


<form action="relat.php">

	<p align="center" style="margin-bottom: 0cm">
        <font face="Loma">
			 <font size="5" style="font-size: 12pt">
				 <u>Escolha um aluno abaixo para responder as perguntas ou digite o nome no campo aluno e pressione cadastrar p/inciair um novo questionário</u>
			 </font>
		</font>
    </p>

<?
$debug=$_SERVER["REMOTE_ADDR"]=='10.0.0.19';
//$debug=false;

//zzz. lista3<br><br>


// https://www.postgresqltutorial.com/postgresql-php/connect/
//$conn = pg_pconnect("host=10.0.10.2; dbname=creche; username=postgres; password=bi#pjePENTAHO");
// https://www.php.net/manual/en/function.pg-fetch-row.php

                $paramshost			= "172.18.0.2";
                $paramsport			= "5432";
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

        $stmt = $pdo->query('SELECT * FROM relat.alunos');
        while ($row = $stmt->fetch(\PDO::FETCH_ASSOC)) {
			echo "<br><a href='relat.php?g=".$row['id']."'>".$row['nome']."</a><br>";

        }

?> 
<br><br>
Escolha um aluno da lista acima ou digite um novo:<br>
<input type=value name=nome_aluno placeholder="Digite novo aluno" size=50>

<br><br>
<input type=submit>


</form>




   </body>
</html>



