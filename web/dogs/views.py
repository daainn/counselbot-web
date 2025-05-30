from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import DogProfileForm
from .models import DogProfile
from user.utils import get_or_create_user  

def dog_info_submit(request):
    if request.method == "POST":
        user, _ = get_or_create_user(request)
        is_guest = request.session.get('guest', False)

        form = DogProfileForm(request.POST)

        if form.is_valid():
            if is_guest:
                request.session['guest_dog_info'] = form.cleaned_data
                return redirect("chat:main")
            else:
                dog_profile = form.save(commit=False)
                dog_profile.user = user
                dog_profile.save()
                return redirect("chat:main")
        else:
            for field, errors in form.errors.items():
                for error in errors:
                    messages.warning(request, f"{error}")

    else:
        form = DogProfileForm()

    return render(request, "dogs/info.html", {"form": form})


# dogs/views.py

# @login_required
from django.shortcuts import render
from .models import DogProfile  

def dog_profile_view(request):
    # dog 프로필을 가져오는 예시 (필요한 필드를 포함)
    dog_profiles = DogProfile.objects.all() 
    selected_dog = dog_profiles.first()  # 선택된 첫 번째 강아지를 예시로

    return render(request, 'common/right-sidebar.html', {
        'dog_profiles': dog_profiles,
        'dog': selected_dog,
    })
