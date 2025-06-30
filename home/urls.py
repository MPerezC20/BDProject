from django.urls import path
from . import views

urlpatterns = [
    path('', views.home_page, name='home_page'),
    path('directory/', views.directory, name='directory'),
    path('directory/<str:isbn>/', views.detail, name='detail'),
]