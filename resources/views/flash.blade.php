@if(Session::has('success'))
		<div class="alert alert-success" role="alert" align="center">
			<strong>{{ Session::get('success') }}</strong>
		</div>


@endif

@if(count($errors) > 0)
		<div class="alert alert-danger" role="alert" align="center">
                <strong>Le titre de la communauté est pris ou la longueur maximale des champs est limitée</strong>

		</div>
@endif
