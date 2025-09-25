# Əsas image-i müəyyən edir. Bu, Python 3.8 versiyalı Alpine Linux-dur.
# Alpine yüngül bir distributivdir və imaj ölçüsünü kiçik saxlayır.
FROM python:3.8-alpine

# İş qovluğunu təyin edir. Bütün fayllar bu qovluğa kopyalanacaq.
WORKDIR /app

# requirements.txt faylını kopyalayır.
# Bu addım cache istifadə edərək tezlik təmin edir.
COPY requirements.txt .

# requirements.txt faylında qeyd olunan paketləri quraşdırır.
RUN pip install --no-cache-dir -r requirements.txt

# Bütün layihə fayllarını iş qovluğuna kopyalayır.
COPY . .

# Konteynerin hansı portda işləyəcəyini göstərir.
# Bu sadəcə sənəd məqsədlidir, portun açılması üçün deyil.
EXPOSE 5000

# Konteyner işə düşdükdə icra olunacaq əmri təyin edir.
# Bu halda, app.py faylını işə salır.
CMD ["python", "app.py"]