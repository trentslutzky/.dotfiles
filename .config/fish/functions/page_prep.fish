function page_prep
mv assets/* .
rm assets/ -r
../../../Scripts/BSStoJinja.py ./*.html
mv ./*.html ../../templates/
end
