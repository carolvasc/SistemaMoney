<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Money - Despesas</title>

        <!-- Bootstrap -->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
		<!--  Estilo CSS -->
        <link href="resources/css/despesa.css" rel="stylesheet">

		<!--  jQuery -->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
		
		<!-- Javascript -->
        <script type="text/javascript" src="resources/javascript/despesa.js"></script>
    </head>
    <body>        
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div id="conteudo">
                <h4>Nova Despesa</h4>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Descri��o</label>
                            <input class="form-class" name="descricao" id="descricao" type="text" autofocus />
                        </div>
                    </div><!-- /col-md-12 -->
                </div><!-- /row -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Valor</label>
                            <input class="form-class" name="valor" id="valor" type="text" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Data</label>
                            <input class="form-class" name="data" id="data" type="text" />
                        </div>
                    </div>
                </div><!-- /row -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Categoria</label>
                            <select class="form-class">
                                <option>[Selecione uma op��o]</option>
                                <option>Educa��o</option>
                                <option>Despesas pessoais</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Pagamento</label>
                            <select class="form-class">
                                <option>[Selecione uma op��o]</option>
                                <option>Dinheiro</option>
                                <option>Cart�o</option>
                            </select>
                        </div>
                    </div>
                </div><!-- /row -->
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-danger" name="repetir" id="btn-repetir">Repetir</button>
                    </div>
                </div><!-- /row -->
                <div class="row" id="box-repetir" hidden>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Repetir</label><br/>
                            <input type="radio" name="despesa" id="despesa-fixa" value="fixa" onclick="getRadioValor();">Despesa Fixa</input><br/>
                            <input type="radio" name="despesa" id="despesa-parcelada" value="parcelada" onclick="getRadioValor();">Lan�amento Parcelado
                            </input>
                        </div>
                    </div>
                    <div class="col-md-6" id="box-desp-fixa" hidden>
                        <div class="form-group">
                            <select class="form-class">
                                <option>Mensal</option>
                                <option>Semestral</option>
                                <option>Anual</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6" id="box-desp-parc" hidden>
                        <div class="col-md-4">
                            <div class="form-group">
                                <input class="form-class" type="text" name="parcelas" id="parcelas" />
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <select class="form-class">
                                    <option>Mensal</option>
                                    <option>Semestral</option>
                                    <option>Anual</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div><!-- /row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group obs-box">
                            <label>Observa��o</label>
                            <textarea class="form-class" name="observacao" id="observacao" rows="4" /></textarea>
                        </div>
                    </div>
                </div><!-- /row -->
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-danger" name="salvar" id="btn-salvar">Salvar</button>
                    </div>
                </div>
            </div><!-- /conteudo --> 
        </div><!-- col-md-6 -->
        <div class="col-md-3"></div>
    </body>
</html>