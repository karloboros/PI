from workalendar.europe import Croatia

# Učitaj kalendar praznika za Hrvatsku
cal = Croatia()

# Iteriraj kroz godine od 2000. do 2024.
for year in range(2000, 2025):
    # Izlistaj sve praznike za trenutnu godinu
    holidays = cal.holidays(year)
    
    # Ispiši sve praznike za trenutnu godinu
    print(f"Praznici za {year}:")
    for holiday in holidays:
        print(holiday[0], holiday[1])
    print("------------------------")
