<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Rental Mobil</title>
    
        <link rel="shortcut icon" href="assets_login/images/fav.jpg">
        <link rel="stylesheet" href="assets_login/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets_login/css/fontawsom-all.min.css">
        <link rel="stylesheet" type="text/css" href="assets_login/css/style.css" />
    </head>
    
    <body>
        <div class="container-fluid ">
            
                    <div class=" no-pdding login-box">
                        <div class="row no-margin w-100 bklmj">
                            <div class="col-lg-6 col-md-6 log-det">
                                
                                <h2>Registrasi</h2>
                                
                               
                                <div class="row no-margin past">
                                    <p>Masukkan <span>Nama, Email dan Password</span> </p>
                                </div>
    
                                <form method="POST" action="{{ route('register') }}">
                                    @csrf
                                <div class="text-box-cont">
                                        <div class="input-group mb-3">
                                            <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" placeholder="Nama Lengkap" required autocomplete="name" autofocus>
            
                                            @error('name')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>

                                    <div class="input-group mb-3">
                                        <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" placeholder="Email" required autocomplete="email" autofocus>

                                        @error('email')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror   
                                    </div>
                                     <div class="input-group mb-3">
                                        <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" placeholder="Password" name="password" required autocomplete="current-password">

                                        @error('password')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror    
                                    </div>
                                    <div class="input-group mb-3">
                                        <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="Konfirmasi Password" required autocomplete="new-password">
                                    </div>
                                    
                               
                                    <div class="right-bkij mb-3">
                                        <button class="btn btn-success btn-round">Registrasi</button>
                                    </div>  
                                    <br> 
                                    
                                </div>
                                </form>
                                
                                 
    
                            </div>
                            <div class="col-lg-6 col-md-6 box-de">
                                <div class="ditk-inf">
                                    <h2 class="w-100">RENTAL MOBIL</h2>
                                    <p>Selamat Datang!!! <br> Sudah punya Akun? Silahkan Login</p>
                                    <a href="{{ route('login') }}" type="button" class="btn btn-outline-light">Login</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           
    </body>
    
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/script.js"></script>
    
    
    </html>