<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
      <title></title>
<!--
      <meta name="generator" content="LibreOffice 7.3.7.2 (Linux)"/>
      <meta name="created" content="2023-04-21T12:27:19.195564888"/>
      <meta name="changed" content="2023-04-21T12:28:14.369685586"/>
-->

	<script type="text/javascript">
		<!--








function getScrollXY() {
  var scrOfX = 0, scrOfY = 0;
  if( typeof( window.pageYOffset ) == 'number' ) {
    //Netscape compliant
    scrOfY = window.pageYOffset;
    scrOfX = window.pageXOffset;
  } else if( document.body && ( document.body.scrollLeft || document.body.scrollTop ) ) {
    //DOM compliant
    scrOfY = document.body.scrollTop;
    scrOfX = document.body.scrollLeft;
  } else if( document.documentElement && ( document.documentElement.scrollLeft || document.documentElement.scrollTop ) ) {
    //IE6 standards compliant mode
    scrOfY = document.documentElement.scrollTop;
    scrOfX = document.documentElement.scrollLeft;
  }
//  return [ scrOfX, scrOfY ];
  return scrOfY;

//alert( 'scrOfX:' + scrOfX + ', scrOfY:' + scrOfY );

}

function setScrollXY_Y(Y) {
  var scrOfX = 0, scrOfY = 0;
  if( typeof( window.pageYOffset ) == 'number' ) {
    //Netscape compliant
window.scrollBy(10, Y);
//    window.pageYOffset=Y;
  } else if( document.body && ( document.body.scrollLeft || document.body.scrollTop ) ) {
    //DOM compliant
    document.body.scrollTop = Y;
  } else if( document.documentElement && ( document.documentElement.scrollLeft || document.documentElement.scrollTop ) ) {
    //IE6 standards compliant mode
    document.documentElement.scrollTop = Y;
  }
}






      function selecionar22(aluno,pergunta){
		  window.location.replace('relat.php?a='+aluno+'&z='+pergunta);
	  }

      function selecionar(aluno,pergunta){

var height = getScrollXY();


		  window.location.replace('relat.php?a='+aluno+'&z='+pergunta + '&h='+height);
	  }



    function copiarTexto() {
document.getElementById("texto").style.visibility = 'visible';
        let textoCopiado = document.getElementById("texto");
        textoCopiado.select();
        textoCopiado.setSelectionRange(0, 99999)
        document.execCommand("copy");
        alert(textoCopiado.value);
document.getElementById("texto").style.visibility = 'hidden';
    }


		-->
	</script>

<style>
	
	
a:hover {
  background-color: yellow;
}

/* Tooltip container */
.tooltip {
  zzposition: relative;
  position: center;
  display: inline-block;
  border-bottom: 1px dotted black; /* If you want dots under the hoverable text */
}

/* Tooltip text */
.tooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  padding: 5px 0;
  border-radius: 6px;
 
  /* Position the tooltip text - see examples below! */
  position: absolute;
  z-index: 1;
}




/* Show the tooltip text when you mouse over the tooltip container */
.tooltip:hover .tooltiptext {
  visibility: visible;
}
</style>



   </head>

<?
      $cabec="Ao longo deste primeiro bimestre, foram observados aspectos relacionados ao processo de adaptação ao ambiente escolar, alimentação, 
      interação e desenvolvimento cognitivo e motor do aluno. Nos parágrafos que seguem registramos o estágio no qual se encontra o aluno.";
?>


   <body lang="pt-BR" dir="ltr">
      <p align="center" style="margin-bottom: 0cm">
         <font face="Loma"><font size="5" style="font-size: 18pt"><u>ROTEIRO
         DE OBSERVAÇÃO PARA ELABORAÇÃO DE RELATÓRIO DESCRITIVO</u></font></font>
      </p>
      <p align="center" style="margin-bottom: 0cm"><font face="Abyssinica SIL"><font size="4" style="font-size: 15pt"><u>Educação
         Infantil</u></font></font>
      </p>
      <p align="center" style="margin-bottom: 0cm"><br/>
      </p>

      <p align="justify" style="margin-bottom: 0cm"><font face="Gargi"><font size="4" style="font-size: 16pt"><?=$cabec;?>...</font></font>
      </p>
      <p align="justify" style="margin-bottom: 0cm"><br/>
      </p>
      <p align="center" style="margin-bottom: 0cm"><br/>
      </p>
      <?

//print_r($_SERVER);

         $debug=$_SERVER["REMOTE_ADDR"]=='10.0.0.18';
         $debug=false;
         
         $idGET=$_GET['g'];
         $idPOST=$_GET['p'];
         
         $idAluno=$idGET;
         
         $aluno=$_GET['a'];
         $resposta=$_GET['z'];
         
         //zzz. lista3<br><br>
         


$setY=$_GET['h'];



         // https://www.postgresqltutorial.com/postgresql-php/connect/
         //$conn = pg_pconnect("host=10.0.10.2; dbname=creche; username=postgres; password=bi#pjePENTAHO");
         // https://www.php.net/manual/en/function.pg-fetch-row.php

                         $paramshost			= "172.19.0.2";
						$paramshost			= "10.0.10.2";
                         $paramshost			= "172.18.0.2";
                         $paramshost			= "172.19.0.4";
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


$pdo->query("SET TIMEZONE TO 'America/Sao_Paulo'");


         if ( ($aluno>0) && ($resposta>0) ){
			 $deletar = false;
//echo 'SELECT * FROM relat.resp_aluno where id_resp_pergunta='.$resposta . ' and id_aluno=' . $aluno;

			$escolhidoStmt = $pdo->query('SELECT * FROM relat.resp_aluno where id_resp_pergunta='.$resposta . ' and id_aluno=' . $aluno);
			while ($escolhidoRow = $escolhidoStmt->fetch(\PDO::FETCH_ASSOC)) {
				$deletar=true;
				$pdo->query('delete FROM relat.resp_aluno where id_resp_pergunta='.$resposta . ' and id_aluno=' . $aluno);
			}
			if(!$deletar){
				$pdo->query('insert into relat.resp_aluno (id,id_aluno,id_resp_pergunta) values ((select max(id)+1 from relat.resp_aluno), '.$aluno.', '.$resposta.')');
			}
			$idGET=$aluno;
			$idAluno=$aluno;
		 }


$nome_aluno=strtoupper(trim($_GET['nome_aluno']));

		 $stmt = $pdo->query("SELECT * FROM relat.alunos where upper(nome)='$nome_aluno'");
		 $inserir=$nome_aluno != "";
//echo "iiiii:$inserir\nnome:$nome_aluno\n\n";exit;

		if($inserir){
			 while ($row = $stmt->fetch(\PDO::FETCH_ASSOC)) {
				$inserir=false;
				$idGET=$row['id'];
				$idAluno=$row['id'];
			 }

			if($inserir){
//echo("insert into relat.alunos (id,nome) values ((select max(id)+1 from relat.alunos),'$nome_aluno')");exit;

				$stmt = $pdo->query("insert into relat.alunos (id,nome) values ((select max(id)+1 from relat.alunos),'$nome_aluno')");
				$stmt = $pdo->query("SELECT * FROM relat.alunos where nome='$nome_aluno'");
				 while ($row = $stmt->fetch(\PDO::FETCH_ASSOC)) {
					$idGET=$row['id'];
					$idAluno=$row['id'];
				 }
			 }
		 }

$sTexto=$cabec."\n\n";

?>

<hr>

<a href="javascript:window.location.replace('aluno.php');">Escolher outro aluno</a>


<?
if ($idGET==""){
?>

	<script type="text/javascript">
		<!--
			alert('informe um nome de aluno para cadasstrar');
			window.location.replace('aluno.php');
		-->
	</script>

<?
}


		 $stmt = $pdo->query('SELECT * FROM relat.alunos where id='.$idGET);
		 while ($row = $stmt->fetch(\PDO::FETCH_ASSOC)) {
$sTexto.=strtoupper($row['nome'])."\n\n";

         


			 echo "
<br><br><br>
	<div>
		<p align=\"center\" style=\"margin-bottom: 0cm\">
				<a href=\"javascript:copiarTexto();\">
					<div class=\"tooltip\">
						<p align=\"center\" style=\"margin-bottom: 0cm\">
							<font face=\"Abyssinica SIL\">
								<font size=\"14\" style=\"font-size: 15pt\">
									<u>". strtoupper($row['nome']) ."</u>
								</font>
							</font>
						</p>
						<span class=\"tooltiptext\">Clique aqui para enviar p/ área de transferência</span>
					</div>
				</a>
		</p>
	</div>
<br><br>";


		 }

/*

https://www.w3schools.com/css/css_tooltip.asp
* 

<span class="tooltiptext">Tooltip text</span>
</div>

*/

 
         
         $aspceto=0;
         
                 $stmt = $pdo->query('SELECT * FROM relat.perguntas');
                 while ($row = $stmt->fetch(\PDO::FETCH_ASSOC)) {
         			if($aspceto != $row['id_aspecto']){
         				$aspceto = $row['id_aspecto'];
         
         				$stmtA = $pdo->query('SELECT * FROM relat.aspectos where id='.$row['id_aspecto']);
         				while ($rowA = $stmtA->fetch(\PDO::FETCH_ASSOC)) {

//$sTexto.="&nbsp;".$rowA['nome']."\n<br>";




echo '
	<p align="center" style="margin-bottom: 0cm">
        <font face="Loma">
			 <font size="5" style="font-size: 12pt">
				 <u>' . ($debug?$rowA['id']:'').$rowA['nome'] . '</u>
			 </font>
		</font>
    </p>
';

//echo "<br><br><br><p align=\"center\" style=\"margin-bottom: 0cm\"><font face=\"Abyssinica SIL\"><font size=\"4\" style=\"font-size: 15pt\"><u>". $rowA['nome'] ."</u></font></font></p><br><br>";
         				}
         
         			}



         			echo "<br>".($debug?$row['id']:'').$row['nome']."<br>";
         
         			$stmt2 = $pdo->query('SELECT * FROM relat.resp_pergunta where id_pergunta='.$row['id']);
         			while ($row_resp_aluno = $stmt2->fetch(\PDO::FETCH_ASSOC)) {
						

$backgroud="background-color: yellow;";

						$escolhaFeita = '[___]';
						$escolhidoStmt = $pdo->query('SELECT * FROM relat.resp_aluno where id_resp_pergunta='.$row_resp_aluno['id'] . ' and id_aluno=' . $idAluno);
						while ($escolhidoRow = $escolhidoStmt->fetch(\PDO::FETCH_ASSOC)) {
							$escolhaFeita = '[_X_]';
$sTexto.="&nbsp;&nbsp;&nbsp;".$row_resp_aluno['nome']."\n\n";
						}



         				echo "&nbsp;&nbsp;&nbsp;<a href=javascript:selecionar(".$idAluno.",".$row_resp_aluno['id'].");>".($debug?$row_resp_aluno['id']:'').$escolhaFeita." ".$row_resp_aluno['nome']."</a><br>";
         			}
         
                 }
         
         
         
         ?> 


   </body>
</html>




<textarea style="visibility: hidden;" name="texto" id="texto" form="usrform"><?=$sTexto;?></textarea>



<script type="text/javascript">
<!--
//alert(<?=$setY;?>);
setScrollXY_Y(<?=$setY;?>);
-->
</script>



<br>
<br>
<br>
<br>

