import pandas as pd
from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import DogProfileForm
from user.utils import get_or_create_user  
from dogs.models import DogBreed, DogProfile
from .forms import DogProfileForm


def dog_info_join_view(request):
    form = DogProfileForm()
    dog_breeds = DogBreed.objects.all().order_by('name')  
    return render(request, 'dogs/dog_info_join.html', {
        'form': form,
        'dog_breeds': dog_breeds   
    })



def dog_info_submit(request):
    if request.method == "POST":
        user, _ = get_or_create_user(request)
        is_guest = request.session.get('guest', False)

        form = DogProfileForm(request.POST)

        if form.is_valid():
            breed_name = request.POST.get('breed_name')
            breed_obj = DogBreed.objects.filter(breed_name=breed_name).first()
            if not breed_obj:
                breed_obj = DogBreed.objects.create(breed_name=breed_name)

            if is_guest:
                request.session['guest_dog_info'] = form.cleaned_data
                return redirect("chat:main")
            else:
                dog_profile = form.save(commit=False)
                dog_profile.user = user
                dog_profile.breed = breed_obj  
                dog_profile.save()
                return redirect("chat:main")
        else:
            for field, errors in form.errors.items():
                for error in errors:
                    messages.warning(request, f"{error}")
    else:
        form = DogProfileForm()

    from dogs.models import DogBreed
    dog_breeds = DogBreed.objects.all()
    return render(request, "dogs/dog_info_join.html", {"form": form, "dog_breeds": dog_breeds})
