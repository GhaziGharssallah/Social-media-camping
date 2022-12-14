@if($post->getLikeCount() == 0)
    <div class="alert alert-danger" role="alert" style="margin: 10px;">Il n'y a pas de j"aimes!</div>
@else
    <p style="padding: 10px 10px 0 10px"><small>{{ $post->getLikeCount() }} @if($post->getLikeCount() > 1){{ 'aime' }}@else{{ 'j"aime' }}@endif</small></p>
    <ul class="list-group">
        @foreach($post->likes()->limit(2000000)->with('user')->get() as $like)
        <li class="list-group-item">
            <a href="{{ url('/'.$like->user->username) }}">
                <img src="{{ $like->user->getPhoto(50, 50) }}" alt="{{ $like->user->name }}" class="img-circle" />
                <span class="name">{{ $like->user->name }}</span><br />
                <small>{{ '@'.$like->user->username }}</small>
            </a>
            <div class="clearfix"></div>
        </li>
        @endforeach
    </ul>
@endif