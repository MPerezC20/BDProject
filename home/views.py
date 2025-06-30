from django.shortcuts import render
from .models import Libro


from django.shortcuts import render
from .models import Libro

def home_page(request):
    fantasia = Libro.objects.filter(genero='Fantasía')
    terror = Libro.objects.filter(genero='Terror')

    context = {
        'header_title': '¡Bienvenido a Mi Directorio!',
        'header_subtitle': 'Encuentra lo que buscas aquí.',
        'fantasia': fantasia,
        'terror': terror,
    }
    return render(request, 'home.html', context)

from django.shortcuts import render
from .models import Libro

def directory(request):
    # Agrupa los libros por género
    libros = Libro.objects.all()
    generos = ['Ficción', 'Clásico', 'Infantil','Terror', 'Suspenso', 'Fantasía']

    grouped_items = {}
    for genero in generos:
        grouped_items[genero] = libros.filter(genero=genero)

    context = {
        'directory_items': grouped_items
    }
    return render(request, 'directory.html', context)

def detail(request, item_id):
    item = {
        'id': item_id,
        'name': f'Detalle del Ítem {item_id}',
        'description': f'Esta es la información detallada del ítem con ID {item_id}.'
    }
    context = {'item': item}
    return render(request, 'detail.html', context)
