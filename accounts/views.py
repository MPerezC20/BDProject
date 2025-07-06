from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .forms import CustomUserCreationForm, CustomAuthenticationForm, CustomUserChangeForm
from django.shortcuts import render, get_object_or_404
from biblioteca.models import Libro
from home.models import VistaInventarioCompleto
from django.contrib.auth.decorators import login_required


@login_required
def ver_sucursales_libro(request, isbn):
    libro = get_object_or_404(Libro, isbn=isbn)
    inventario = VistaInventarioCompleto.objects.filter(isbn=isbn)

    context = {
        'libro': libro,
        'inventario': inventario
    }
    return render(request, 'sucursales_libro.html', context)

def register_view(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.email = form.cleaned_data['email']
            user.save()
            login(request, user)
            return redirect('dashboard')
        else:
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
                form.add_error(None, "Nombre de usuario o contraseña incorrectos.")
    else:
        form = CustomAuthenticationForm()
    return render(request, 'login.html', {'form': form})

@login_required
def dashboard(request):
    search_query = request.GET.get('q', '').strip()
    
    if search_query:
        resultados = Libro.objects.filter(titulo__icontains=search_query)
    else:
        resultados = None

    fantasia = Libro.objects.filter(genero='Fantasía')
    terror = Libro.objects.filter(genero='Terror')
    clasico = Libro.objects.filter(genero='Clásico')
    suspenso = Libro.objects.filter(genero='Suspenso')
    infantil = Libro.objects.filter(genero='Infantil')
    ficcion = Libro.objects.filter(genero='Ficcion')

    destacados = Libro.objects.filter(titulo__in=['Moby Dick', 'La chica del tren', 'Drácula'])

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
        'search_query': search_query,
        'resultados': resultados,
    }
    return render(request, 'dashboard.html', context)

@login_required
def userDirectory(request):
    query = request.GET.get('q', '').strip()
    libros = Libro.objects.all()

    if query:
        libros = libros.filter(titulo__icontains=query)

    generos = ['Ficción', 'Clásico', 'Infantil', 'Terror', 'Suspenso', 'Fantasía', 'Romance', 'Poesía', 'Experimental', 'Clásico griego']
    
    grouped_items = {}
    for genero in generos:
        grouped_items[genero] = libros.filter(genero=genero)

    context = {
        'directory_items': grouped_items,
        'search_query': query
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
            return redirect('ver_perfil')
    else:
        form = CustomUserChangeForm(instance=request.user)

    return render(request, 'editperfil.html', {'form': form})

def user_logout(request):
    logout(request)
    return redirect('home_page')