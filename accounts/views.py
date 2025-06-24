from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .forms import CustomUserCreationForm, CustomAuthenticationForm


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
    # Esta es la interfaz del usuario después de iniciar sesión
    return render(request, 'dashboard.html', {'user': request.user})

def user_logout(request):
    logout(request)
    return redirect('home_page') # Redirige a la página de inicio después del logout