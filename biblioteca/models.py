# biblioteca/models.py
from django.db import models

class Libro(models.Model):
    titulo = models.CharField(max_length=200)
    autor = models.CharField(max_length=100)
    editorial = models.CharField(max_length=100)
    fecha_publicacion = models.DateField()
    isbn = models.CharField(max_length=13, unique=True)
    paginas = models.IntegerField()
    disponible = models.BooleanField(default=True)

    def __str__(self):
        return self.titulo
