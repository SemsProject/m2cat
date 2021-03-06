<!DOCTYPE html>
<%@page import="de.unirostock.sems.M2CAT.Util"%>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>M2CAT</title>
	
	<!-- Bootstrap -->
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
	
	<!-- main css -->
	<link href="resources/css/main.css" rel="stylesheet" /> 
	<!-- index css -->
	<link href="resources/css/index.css" rel="stylesheet" />
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
<body>
	<!-- feedback button -->
	<% String feedbackUrl = Util.getFeedbackUrl(request); 
	if( feedbackUrl != null) { %>
	<div id="feedback">
		<a href="<%=feedbackUrl%>" title="feedback"></a>
	</div>
	<% } %>
	
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" 
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/#">M2CAT</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="search">Search</a></li>
<!-- 					<li><a href="about">About</a></li> -->
<!-- 					<li><a href="impress">Impress</a></li> -->
				</ul>
			</div>
		</div>
	</nav>

	<!-- corporate logos -->
	<div class="container hidden-xs corporate-container">
		<div class="row">
			<div class="corporate-row col-md-4 col-sm-6">
				<img src="resources/img/uni.png" class="img-responsive" alt="University Rostock" />
			</div>
			<div class="corporate-row col-md-4 col-md-offset-4 col-sm-6">
				<img src="resources/img/sems.png" class="img-responsive" alt="Simulation Experiment Management System" />
			</div>
		</div>
	</div>
	
	<!-- search form -->
	<div class="container">
		<div id="logo-row" class="row">
			<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1">
				<img src="resources/img/m2cat.png" class="img-responsive logo" alt="M2CAT" />
			</div>
		</div>
		
		<div id="searchform-row" class="row">
			<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1">
				<form class="form-inline" action="search" method="GET">
					<input type="text" class="form-control" name="q" placeholder="search term" />
					<input type="submit" class="btn btn-default btn-primary" value="Search" />
					
					<div class="beta-note">
						This implementation is a beta version. Please keep in mind that this version is not necessarily bug free.
						If you find errors or have suggestions please contact us<% if( feedbackUrl != null) { %> using the Feedback button<% } %>.
					</div>
					
				  	<div class="row aggregation-settings">
				  		<div class="col-md-6 col-xl-6 col-sm-6">
							<label> Aggregation Type:</label> <br>
							<select name="aggregationType" onchange='checkMethod(this.value);'>
    							<option value="DEFAULT"> Default</option>
    							<option value="ADJACENT_PAIRS"> Adjacent Pairs</option>
    							<option value="COMB_MNZ"> CombMNZ</option>
    							<option value="LOCAL_KEMENIZATION"> Local Kemenization</option>
    							<option value="SUPERVISED_LOCAL_KEMENIZATION"> Supervised Local Kemenization</option>
    							</select>
    						
							<script type="text/javascript">
    						function checkMethod(val){
    							var element=document.getElementById('weightsText');
    							var element1=document.getElementById('weight1');
    							var element2=document.getElementById('weight2');
    							var element3=document.getElementById('weight3');
    							var element4=document.getElementById('weight4');
    							var elementDefault=document.getElementById('defaultWeights');
    							var elementInputWeights=document.getElementById('inputWeights');
 								if(val=='SUPERVISED_LOCAL_KEMENIZATION'){
 									element.style.display='block';
   									element1.style.display='block';
   									element2.style.display='block';
   									element3.style.display='block';
   									element4.style.display='block';
   									elementDefault.style.display='block';
   									elementInputWeights.style.display='block';
 								}

 								else  {
 									element.style.display='none';
 									element1.style.display='none';
 									element2.style.display='none';
 									element3.style.display='none';
 									element4.style.display='none';
 									elementDefault.style.display='none';
 									elementInputWeights.style.display='none';
 								}
								}
							</script> 
							 
							
  							<!--
		       				<label class="radio">
		         				<input type="radio" name="aggregationType" class="toggle" value="DEFAULT" checked="checked"> Default
		       				</label> <br>
		       				<label class="radio">
		         				<input type="radio" name="aggregationType" class="toggle" value="ADJACENT_PAIRS"> Adjacent Pairs
		      				 </label> <br>
		       				<label class="radio">
		         				<input type="radio" name="aggregationType" class="toggle" value="COMB_MNZ"> CombMNZ
		       				</label> <br>
		       				<label class="radio">
		         				<input type="radio" name="aggregationType" class="toggle" value="LOCAL_KEMENIZATION"> Local Kemenization
		       				</label> <br>
		       				<label class="radio">
		         				<input type="radio" name="aggregationType" class="toggle" value="SUPERVISED_LOCAL_KEMENIZATION"> Supervised Local Kemenization
		       				</label> <br> -->
	       				</div>
	       				
	       				<div class="col-md-6 col-xl-6 col-sm-6">
							<label id="weightsText" style='display:none;'> Rankers weights (1 - 99):</label> 
							<input type="text" id="weight1" name="modelRankerWeight" placeholder="Model Index" onkeypress="return validate(event)" style='display:none;'/>
							<input type="text" id="weight2" name="annotationRankerWeight" placeholder="Annotation Index" onkeypress="return validate(event)" style='display:none;'/>
							<input type="text" id="weight3" name="personRankerWeight" placeholder="Person Index" onkeypress="return validate(event)" style='display:none;'/> 
							<input type="text" id="weight4" name="publicationRankerWeight" placeholder="Publication Index" onkeypress="return validate(event)" style='display:none;'/>
							
							<label class="radio" id="defaultWeights" style="display:none">
								<input type="radio" class="toggle" name="weights" onclick="disable()"> Default Weights
							</label> 
							<label class="radio" id="inputWeights" style="display:none">
								<input type="radio" class="toggle" name="weights" checked="checked"  onclick="enable()"> Input Weights
							</label> 
							<script type="text/javascript">
								function disable() {
    								document.getElementById("weight1").disabled = true;
    								document.getElementById("weight1").value = "";
    								document.getElementById("weight2").disabled = true;
    								document.getElementById("weight2").value = "";
    								document.getElementById("weight3").disabled = true;
    								document.getElementById("weight3").value = "";
    								document.getElementById("weight4").disabled = true;
    								document.getElementById("weight4").value = "";
								}
							</script>
							<script type="text/javascript">
								function enable() {
    								document.getElementById("weight1").disabled = false;
    								document.getElementById("weight2").disabled = false;
    								document.getElementById("weight3").disabled = false;
    								document.getElementById("weight4").disabled = false;
								}
							</script>
							<script type="text/javascript">
							function validate(evt){
							    var charCode = (evt.which) ? evt.which : event.keyCode;
							    	    if (charCode > 31 && ((charCode <48) || (charCode > 57)))
							    	        return false
							    	    var weight = parseInt(document.getElementById("weight1").value);
							    	    if(weight > 99)
							    	    	return false;
							    	    var weight = parseInt(document.getElementById("weight2").value);
							    	    if(weight > 99)
							    	    	return false;
							    	    var weight = parseInt(document.getElementById("weight3").value);
							    	    if(weight > 99)
							    	    	return false;
							    	    var weight = parseInt(document.getElementById("weight4").value);
							    	    if(weight > 99)
							    	    	return false;
							    	    return true;
							    	}
							</script>
						</div>
					</div> 
				</form>
			</div>  
		</div>
	</div>    

	<footer class="footer">
		<div class="container">
			<p class="text-muted">(c) 2015 SEMS @ University Rostock</p>
		</div>
	</footer>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="resources/js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>