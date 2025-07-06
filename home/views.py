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
    query = request.GET.get('q', '').strip()
    libros = Libro.objects.all()

    if query:
        # Filtra libros por el título
        resultados = libros.filter(titulo__icontains=query)
        context = {
            'search_query': query,
            'resultados': resultados,
        }
    else:
        # Muestra libros agrupados por género
        generos = ['Ficción', 'Clásico', 'Infantil', 'Terror', 'Suspenso',
                   'Fantasía', 'Romance', 'Poesía', 'Clásico griego', 'Experimental']
        grouped_items = {genero: libros.filter(genero=genero) for genero in generos}
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