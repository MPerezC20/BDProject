from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .forms import CustomUserCreationForm, CustomAuthenticationForm, CustomUserChangeForm
from django.shortcuts import render, get_object_or_404
from home.models import Libro, Inventario

def ver_sucursales(request, isbn):
    libro = get_object_or_404(Libro, isbn=isbn)
    inventario = Inventario.objects.select_related('id_local').filter(libro=libro)

    return render(request, 'ver_sucursales.html', {
        'libro': libro,
        'inventario': inventario
    })

def register_view(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.email = form.cleaned_data['email']  # Asegura el guardado del email
            user.save()
            login(request, user)
            return redirect('dashboard')
        else:
            # Imprime errores en consola para diagnóstico
            print(form.errors)  
    else:
        form = CustomUserCreationForm()
    
    return render(request, 'register.html', {'form': form})

def user_login(request):
    if request.method == 'POST':
        form = CustomAuthenticationForm(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('dashboard')
            else:
                # Opcional: Añadir un mensaje de error si la autenticación falla
                form.add_error(None, "Nombre de usuario o contraseña incorrectos.")
    else:
        form = CustomAuthenticationForm()
    return render(request, 'login.html', {'form': form})

@login_required
def dashboard(request):
    fantasia = Libro.objects.filter(genero='Fantasía')
    terror = Libro.objects.filter(genero='Terror')
    clasico = Libro.objects.filter(genero='Clásico')
    suspenso = Libro.objects.filter(genero='Suspenso')
    infantil = Libro.objects.filter(genero='Infantil')
    ficcion = Libro.objects.filter(genero='Ficcion')

    # Traer libros por título
    titulos_destacados = ['Moby Dick', 'La chica del tren', 'Drácula']
    destacados = Libro.objects.filter(titulo__in=titulos_destacados)

    context = {
        'header_title': '¡Bienvenido a Mi Directorio!',
        'header_subtitle': 'Encuentra lo que buscas aquí.',
        'fantasia': fantasia,
        'terror': terror,
        'clasico': clasico,
        'suspenso': suspenso,
        'infantil': infantil,
        'ficcion': ficcion,
        'destacados': destacados,
    }
    context['user'] = request.user
    return render(request, 'dashboard.html', context)

@login_required
def userDirectory(request):
    # Agrupa los libros por género
    libros = Libro.objects.all()
    generos = ['Ficción', 'Clásico', 'Infantil','Terror', 'Suspenso', 'Fantasía']

    grouped_items = {}
    for genero in generos:
        grouped_items[genero] = libros.filter(genero=genero)

    context = {
        'directory_items': grouped_items
    }
    return render(request, 'userDirectory.html', context)

@login_required
def Detalle(request, isbn):
    item = Libro.objects.get(isbn=isbn)
    page_from = request.GET.get('from', 'userDirectory')

    context = {
        'item': item,
        'page_from': page_from,
    }
    return render(request, 'Detalle.html', context)

@login_required
def ver_perfil(request):
    user = request.user
    return render(request, 'ver_perfil.html', {'user': user})

@login_required
def edit_profile(request):
    if request.method == 'POST':
        form = CustomUserChangeForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            # Redirige al perfil después de guardar cambios
            return redirect('ver_perfil')
    else:
        form = CustomUserChangeForm(instance=request.user)

    return render(request, 'editperfil.html', {'form': form})

def user_logout(request):
    logout(request)
    return redirect('home_page') # Redirige a la página de inicio después del logout