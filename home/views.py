from django.shortcuts import render

def home_page(request):
    context = {
        'header_title': '¡Bienvenido a Mi Directorio!',
        'header_subtitle': 'Encuentra lo que buscas aquí.'
    }
    return render(request, 'home.html', context)

def directory(request):
    # Lista de ítems con categoría incluida
    directory_items = [
        {'id': 1, 'name': 'Artículo 1', 'description': 'Descripción del Artículo 1', 'category': 'Artículos'},
        {'id': 2, 'name': 'Servicio 2', 'description': 'Descripción del Servicio 2', 'category': 'Servicios'},
        {'id': 3, 'name': 'Producto 3', 'description': 'Descripción del Producto 3', 'category': 'Productos'},
        {'id': 4, 'name': 'Artículo 4', 'description': 'Descripción del Artículo 4', 'category': 'Artículos'},
        {'id': 5, 'name': 'Producto 5', 'description': 'Descripción del Producto 5', 'category': 'Productos'},
        {'id': 6, 'name': 'Recurso 6', 'description': 'Descripción del Recurso 6', 'category': 'Recursos'},
    ]

    # Agrupar por categoría
    grouped_items = {}
    for item in directory_items:
        category = item['category']
        if category not in grouped_items:
            grouped_items[category] = []
        grouped_items[category].append(item)

    context = {'directory_items': grouped_items}
    return render(request, 'directory.html', context)

def detail(request, item_id):
    item = {
        'id': item_id,
        'name': f'Detalle del Ítem {item_id}',
        'description': f'Esta es la información detallada del ítem con ID {item_id}.'
    }
    context = {'item': item}
    return render(request, 'detail.html', context)
