from django.shortcuts import render
from .models import Libro
from django.shortcuts import get_object_or_404

def home_page(request):
    fantasia = Libro.objects.filter(genero='Fantasía')
    terror = Libro.objects.filter(genero='Terror')
    clasico = Libro.objects.filter(genero='Clásico')
    suspenso = Libro.objects.filter(genero='Suspenso')
    infantil = Libro.objects.filter(genero='Infantil')
    ficcion = Libro.objects.filter(genero='Ficcion')
    romance = Libro.objects.filter(genero='Romance')
    poesia = Libro.objects.filter(genero='Poesía')
    clasicogriengo = Libro.objects.filter(genero='Clásico griego')
    experimental = Libro.objects.filter(genero='Experimental')

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
        'romance': romance,
        'poesia': poesia,
        'clasicogriengo': clasicogriengo,
        'experimental': experimental,
        'destacados': destacados,
    }
    return render(request, 'home.html', context)

def directory(request):
    # Agrupa los libros por género
    libros = Libro.objects.all()
    generos = ['Ficción', 'Clásico', 'Infantil','Terror', 'Suspenso', 'Fantasía', 'Romance', 'Poesía', 'Clásico griego', 'Experimental']

    grouped_items = {}
    for genero in generos:
        grouped_items[genero] = libros.filter(genero=genero)

    context = {
        'directory_items': grouped_items
    }
    return render(request, 'directory.html', context)

def detail(request, isbn):
    item = Libro.objects.get(isbn=isbn)
    page_from = request.GET.get('from', 'directory')

    context = {
        'item': item,
        'page_from': page_from,
    }
    return render(request, 'detail.html', context)