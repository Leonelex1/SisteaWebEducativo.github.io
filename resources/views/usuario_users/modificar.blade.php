@extends('layouts/app')
@section('titulo', 'Modificar Usuario')
@section('content')
    @if (Auth::user()->tipo == 1)
        @if (session('correcto'))
            <script>
                $(function notificacion() {
                    new PNotify({
                        title: 'CORRECTO',
                        type: 'success',
                        text: "{{ session('correcto') }}",
                        styling: 'bootstrap3'
                    });
                })

            </script>
        @endif
        @if (session('incorrecto'))
            <script>
                $(function notificacion() {
                    new PNotify({
                        title: 'ERROR',
                        type: 'warning',
                        text: "{{ session('incorrecto') }}",
                        styling: 'bootstrap3'
                    });
                })

            </script>
        @endif

        @if (session('duplicado'))
            <script>
                $(function notificacion() {
                    new PNotify({
                        title: 'ERROR',
                        type: 'warning',
                        text: "{{ session('duplicado') }}",
                        styling: 'bootstrap3'
                    });
                })

            </script>
        @endif

      

        <div id="modal-edit">
            @foreach ($sql as $i)
                <h3 class="text-center" style="margin-bottom: 35px">MODIFICAR USUARIO</h3>
                <form action="{{ route('usuarios.update') }}" method="POST">
                    @csrf
                    <input hidden type="text" value="{{ $i->id }}" name="id">
                    <div>
                        @error('dni')
                            <small>*{{ $message }}</small>
                        @enderror
                        <input type="number" id="dni" placeholder="Clave" name="dni" value="{{ $i->dni }}">
                        @error('nombre')
                            <small>*{{ $message }}</small>
                        @enderror
                        <input type="text" id="nombre" placeholder="Nombre" name="nombre" value="{{ $i->name }}">
                        @error('apellido')
                            <small>*{{ $message }}</small>
                        @enderror
                        <input type="text" id="apellido" placeholder="Apellido" name="apellido" value="{{ $i->apellido }}">
                        @error('email')
                            <small>*{{ $message }}</small>
                        @enderror
                        <input type="email" placeholder="Correo" name="email" value="{{ $i->email }}">
                        @error('tipo')
                            <small>*{{ $message }}</small>
                        @enderror
                        <select name="tipo">
                            <option {{ $i->tipo == 1 ? 'selected' : '' }} value="1">Administrador
                            </option>
                            <option {{ $i->tipo == 2 ? 'selected' : '' }} value="2">Docente</option>
                            <option {{ $i->tipo == 3 ? 'selected' : '' }} value="3">Estudiante
                            </option>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <a href="{{ route('usuarios.index') }}" class="btn btn-secondary" data-dismiss="modal">ATRAS</a>
                        <button type="submit" class="btn btn-primary">GUARDAR</button>
                    </div>
                </form>
            @endforeach
        </div>

        <script>
      
            $("#dni").change(function() {
                var dni = document.querySelector("#dni").value;
                fetch('https://dni.optimizeperu.com/api/persons/' + dni)
                    .then(res =>
                        res.json()
                    )
                    .then(
                        data => {
                            document.querySelector("#nombre").value = (data.name);
                            document.querySelector("#apellido").value = (data
                                .first_name + " " +
                                data
                                .last_name);
                        }
                    );
                console.log("bien")
            })
 

        </script>


    @endif
@endsection
