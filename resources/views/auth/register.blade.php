<form class="register" role="form" method="POST" action="{{ route('register') }}">
    <input type="hidden" value="register" name="tab" />
    {{ csrf_field() }}

    <h2>Découvrez le meilleur camping en toute sécurité!</h2>
    <h1>Let's camp</h1>

    <div class="row">
        <div class="form-group{{ old('tab') == 'register' && $errors->has('name') ? ' has-error' : '' }} col-md-12">
            <label for="name" class="control-label">Prénom</label>

            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="fa fa-user-circle-o"></i> </span>

                    <input id="name" type="text" placeholder="Name" class="form-control" name="name" value="{{ old('name') }}" required autofocus>

                </div>

                @if (old('tab') == 'register' && $errors->has('name'))
                    <span class="help-block">
                    <strong>{{ $errors->first('name') }}</strong>
                </span>
                @endif
            </div>
        </div>

    <div class="form-group{{ old('tab') == 'register' && $errors->has('username') ? ' has-error' : '' }} col-md-12">
            <label for="username" class="control-label">Nom de famille</label>

            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="fa fa-user"></i> </span>

                    <input id="username" type="text" class="form-control" placeholder="Surname" name="username" value="{{ old('username') }}" required>

                </div>
                @if (old('tab') == 'register' && $errors->has('username'))
                    <span class="help-block">
                    <strong>{{ $errors->first('username') }}</strong>
                </span>
                @endif
            </div>


        </div>
    
        <div class="form-group{{ old('tab') == 'register' && $errors->has('email') ? ' has-error' : '' }} col-md-12">
            <label for="email" class="control-label">E-Mail</label>

            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="fa fa-envelope"></i> </span>

                    <input id="email" type="email" class="form-control" placeholder="email@example.com" name="email" value="{{ old('email') }}" required>

                </div>
                @if (old('tab') == 'register' && $errors->has('email'))
                    <span class="help-block">
                    <strong>{{ $errors->first('email') }}</strong>
                </span>
                @endif
            </div>


        </div>


        <div class="form-group{{ old('tab') == 'register' && $errors->has('password') ? ' has-error' : '' }} col-md-12">
            <label for="password" class="control-label">Mot de passe</label>

            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="fa fa-unlock-alt"></i> </span>

                    <input id="password" type="password" placeholder="********" class="form-control" name="password" required>

                </div>
                @if (old('tab') == 'register' && $errors->has('password'))
                    <span class="help-block">
                        <strong>{{ $errors->first('password') }}</strong>
                    </span>
                @endif
            </div>
        </div>

        <div class="form-group  col-md-12">
            <label for="password-confirm" class="control-label">Confirmation du mot de passe</label>

            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="fa fa-unlock-alt"></i> </span>

                    <input id="password-confirm" type="password" placeholder="********" class="form-control" name="password_confirmation" required>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-8 col-md-offset-2">
                <button type="submit" class="btn btn-primary btn-register">
                    Inscription
                </button>
            </div>
        </div>
    </div>
</form>