@extends('voyager::master')

@section('content')
    <div class="page-content">
        @include('voyager::alerts')

        <?php 
         $users = \App\Models\User::all(); $nb_users = count($users);
         $pubs = \App\Models\Post::all(); $nb_pubs = count($pubs);
        ?>
        
        <div class="container">
    <div class="row">
		<div class="col-md-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">Utilisateurs</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-down"></i></span>
				</div>
				<div class="panel-body"><b>{{ $nb_users }}</b> user(s)</div>
			</div>
		</div>

		<div class="col-md-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">Publications</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-down"></i></span>
				</div>
				<div class="panel-body">{{ $nb_pubs }} Publication(s)</div>
			</div>
		</div>
	</div>

        </div>


@stop
