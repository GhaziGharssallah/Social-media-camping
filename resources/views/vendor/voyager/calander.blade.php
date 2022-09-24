    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

   <!-- <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->

      
    <div class="page-content">

<br><br>
<div class="clearfix container-fluid row">
<div class="col-md-6">

	    <div class="panel panel-primary">

	        <div class="panel-heading">

	            Nos rendez-vous    
 
	        </div>

	        <div class="panel-body" >

<a href="" data-toggle="modal" data-target="#modalLoginForm">
	            {!! $calendar->calendar() !!}
</a>
	            {!! $calendar->script() !!}
 

	        </div>
	    </div>
     </div></div>

<div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Reservation</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
          <i class="fas fa-envelope prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="defaultForm-email">user</label>
          <input type="email" id="defaultForm-email" class="form-control validate">  
        </div>

        <div class="md-form mb-4">
          <i class="fas fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="defaultForm-pass">salle</label>
          <input type="password" id="defaultForm-pass" class="form-control validate">  
        </div>

        <div class="md-form mb-4">
          <i class="fas fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="defaultForm-pass">start_date</label>
          <input type="date" id="start_date" name="start_date" class="form-control timepicker">
        </div>

        <div class="md-form mb-4">
          <i class="fas fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="defaultForm-pass">end_date</label>
          <input type="date" id="end_date" name="end_date" class="form-control timepicker">
        </div>

        <div class="md-form mb-4">
          <i class="fas fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="defaultForm-pass">title</label>
          <input type="password" id="defaultForm-pass" class="form-control validate">
        </div>

        <div class="md-form mb-4">
          <i class="fas fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="defaultForm-pass">color</label>
          <input type="password" id="defaultForm-pass" class="form-control validate">
        </div>

      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-default">Ajouter</button>
      </div>
    </div>
  </div>
</div>

