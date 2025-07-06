from django.urls import path
from .views import register_view, user_login, user_logout, dashboard, userDirectory, Detalle, edit_profile, ver_perfil, ver_sucursales_libro

urlpatterns = [
    path('perfil/', ver_perfil, name='ver_perfil'),
    path('perfil/editar/', edit_profile, name='editperfil'),
    path('userDirectory/', userDirectory, name='userDirectory'),
    path('register/', register_view, name='register'),
    path('login/', user_login, name='login'),
    path('logout/', user_logout, name='logout'),
    path('dashboard/', dashboard, name='dashboard'),
    path('libro/<str:isbn>/', Detalle, name='Detalle'),
    path('sucursales-libro/<str:isbn>/', ver_sucursales_libro, name='ver_sucursales_libro'),
]
