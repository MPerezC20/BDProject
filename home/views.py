from django.shortcuts import render, get_object_or_404
from biblioteca.models import Libro
from biblioteca.models import Libro, Inventario, Local

def home_page(request):
    fantasia = Libro.objects.filter(genero='Fantasía').select_related('autor', 'editorial')
    terror = Libro.objects.filter(genero='Terror').select_related('autor', 'editorial')
    clasico = Libro.objects.filter(genero='Clásico').select_related('autor', 'editorial')
    suspenso = Libro.objects.filter(genero='Suspenso').select_related('autor', 'editorial')
    infantil = Libro.objects.filter(genero='Infantil').select_related('autor', 'editorial')
    ficcion = Libro.objects.filter(genero='Ficcion').select_related('autor', 'editorial')
    romance = Libro.objects.filter(genero='Romance').select_related('autor', 'editorial')
    poesia = Libro.objects.filter(genero='Poesía').select_related('autor', 'editorial')
    clasicogriengo = Libro.objects.filter(genero='Clásico griego').select_related('autor', 'editorial')
    experimental = Libro.objects.filter(genero='Experimental').select_related('autor', 'editorial')

    titulos_destacados = ['Moby Dick', 'La chica del tren', 'Drácula']
    destacados = Libro.objects.filter(titulo__in=titulos_destacados).select_related('autor', 'editorial')

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
    libros = Libro.objects.select_related('autor', 'editorial').all()

    if query:
        resultados = libros.filter(titulo__icontains=query)
        context = {
            'search_query': query,
            'resultados': resultados,
        }
    else:
        generos = ['Ficción', 'Clásico', 'Infantil', 'Terror', 'Suspenso',
                   'Fantasía', 'Romance', 'Poesía', 'Clásico griego', 'Experimental']
        grouped_items = {
            genero: libros.filter(genero=genero)
            for genero in generos
        }
        context = {
            'directory_items': grouped_items
        }

    return render(request, 'directory.html', context)

def detail(request, isbn):
    item = get_object_or_404(Libro.objects.select_related('autor', 'editorial'), isbn=isbn)
    page_from = request.GET.get('from', 'directory')

    disponibilidad = Inventario.objects.filter(
        isbn =isbn,
        cantidad_disponible__gt=0
    ).select_related('Id_Local')

    context = {
        'item': item,
        'disponibilidad': disponibilidad,
        'page_from': page_from,
    }
    return render(request, 'detail.html', context)
