function varargout = tampilan(varargin)
% TAMPILAN MATLAB code for tampilan.fig
%      TAMPILAN, by itself, creates a new TAMPILAN or raises the existing
%      singleton*.
%
%      H = TAMPILAN returns the handle to a new TAMPILAN or the handle to
%      the existing singleton*.
%
%      TAMPILAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TAMPILAN.M with the given input arguments.
%
%      TAMPILAN('Property','Value',...) creates a new TAMPILAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tampilan_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tampilan_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tampilan

% Last Modified by GUIDE v2.5 27-Nov-2023 02:24:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tampilan_OpeningFcn, ...
                   'gui_OutputFcn',  @tampilan_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before tampilan is made visible.
function tampilan_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tampilan (see VARARGIN)

% Choose default command line output for tampilan
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tampilan wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tampilan_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    axes_to_use_gray = handles.axes19;
    axes_to_use_hist = handles.axes20;

    folder_path = 'D:\pengolahan citra\GUI\Gui\DataTraining';

    % Dapatkan daftar file dalam folder dengan ekstensi gambar tertentu (misalnya, jpg)
    image_files = dir(fullfile(folder_path, '*.jpg'));

    % Inisialisasi sel untuk menyimpan hasil ekstraksi
    extracted_data = cell(length(image_files), 1);

    % Loop untuk membaca dan memproses setiap file gambar
    for i = 1:length(image_files)
        % Baca gambar
        current_image_path = fullfile(folder_path, image_files(i).name);
        current_image = imread(current_image_path);

        % Ubah gambar menjadi grayscale
        gray_image = rgb2gray(current_image);

        % Hitung histogram dari red channel
        red_channel_hist = imhist(current_image(:, :, 1));

        % Hitung GLCM pada kanal merah
        pixel_dist = 1;
        red_channel = current_image(:, :, 1);
        GLCM = graycomatrix(red_channel, 'Offset', [0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);

        % Hitung statistik GLCM
        stats = graycoprops(GLCM, {'Contrast', 'Correlation', 'Homogeneity', 'Energy'});

        Contrast = stats.Contrast;
        Correlation = stats.Correlation;
        Energy = stats.Energy;
        Homogeneity = stats.Homogeneity;

        % Simpan data ke dalam file Excel tanpa menggantikan yang sudah ada
        file_name = 'hasil_analisis.xlsx';

        if exist(file_name, 'file')
            % Baca data yang sudah ada dari Excel
            existing_data = xlsread(file_name);

            % Tambahkan data baru ke data yang sudah ada
            new_data = [Contrast(1), Contrast(2), Contrast(3), Contrast(4), mean(Contrast), red_channel_hist(1);
                Correlation(1), Correlation(2), Correlation(3), Correlation(4), mean(Correlation), red_channel_hist(2);
                Energy(1), Energy(2), Energy(3), Energy(4), mean(Energy), red_channel_hist(3);
                Homogeneity(1), Homogeneity(2), Homogeneity(3), Homogeneity(4), mean(Homogeneity), red_channel_hist(4)];

            data = [existing_data; new_data];
        else
            % Jika file Excel belum ada, buat data baru
            data = [Contrast(1), Contrast(2), Contrast(3), Contrast(4), mean(Contrast), red_channel_hist(1);
                Correlation(1), Correlation(2), Correlation(3), Correlation(4), mean(Correlation), red_channel_hist(2);
                Energy(1), Energy(2), Energy(3), Energy(4), mean(Energy), red_channel_hist(3);
                Homogeneity(1), Homogeneity(2), Homogeneity(3), Homogeneity(4), mean(Homogeneity), red_channel_hist(4)];
        end

        % Simpan data ke dalam file Excel
        xlswrite(file_name, data, 'Sheet1', 'A1');

        % Menampilkan pesan sukses
        msgbox('Hasil analisis telah disimpan di hasil_analisis.xlsx', 'Sukses', 'help');
        set(handles.uitable3, 'Data', data(end-3:end, :), 'ForegroundColor', [0 0 0]);

        % Contoh: Tampilkan gambar pada axes yang ditentukan
        axes(axes_to_use_gray);
        imshow(gray_image);
        title(axes_to_use_gray, ['Image ', num2str(i)]);

        % Tampilkan histogram red channel pada axes yang ditentukan
        axes(axes_to_use_hist);
        bar(red_channel_hist, 'r');
        title(axes_to_use_hist, 'Red Channel Histogram');

        % Tunggu beberapa saat sebelum melanjutkan
        pause(1);
    end
    
% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Minta pengguna untuk memilih gambar
[filename, pathname] = uigetfile({'*.jpg;*.jpeg;*.png;*.bmp;*.gif', 'Supported Image Files'}, 'Pilih Gambar');
if ischar(filename) && ischar(pathname)
    % Baca gambar yang dipilih
    img = imread(fullfile(pathname, filename));

    % Cek apakah gambar sudah grayscale, jika tidak, konversi ke grayscale
    if size(img, 3) == 3
        img = rgb2gray(img);
    end

    % Tampilkan gambar di axes1
    imshow(img, 'Parent', handles.axes19);
    title(handles.axes19, 'Citra Grayscale');

    % Simpan gambar ke dalam variabel handles jika Anda ingin mengaksesnya nanti
    handles.current_image = img;
    guidata(hObject, handles);
end

    
% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles, 'current_image')
    % Ambil gambar dari variabel handles
    img = handles.current_image;
    
    % Hitung warna RGB pada gambar
    red_channel = img(:, :, 1);
    
    red_mean = mean(red_channel(:));
    
% Ambil kanal merah (red channel) dari gambar
    red_channel = img(:, :, 1);
    
    % Hitung GLCM pada kanal merah
    pixel_dist = 1;
    GLCM = graycomatrix(red_channel, 'Offset', [0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
    
    % Hitung statistik GLCM
    stats = graycoprops(GLCM, {'Contrast', 'Correlation', 'Homogeneity', 'Energy'});
    
    Contrast = stats.Contrast;
    Correlation = stats.Correlation;
    Energy = stats.Energy;
    Homogeneity = stats.Homogeneity;
    
    % Menampilkan histogram kanal merah
    red_hist = imhist(red_channel);

    % Menyimpan histogram dalam variabel handles untuk digunakan nanti
    handles.red_hist = red_hist;
    guidata(hObject, handles);

    % Menampilkan histogram dalam axes20
    axes(handles.axes20);
    bar(red_hist, 'r');
    title(handles.axes20, 'Histogram Kanal Merah (Red Channel)');
    xlabel(handles.axes20, 'Intensitas Piksel');
    ylabel(handles.axes20, 'Jumlah Piksel');
    
    % Simpan data ke dalam file Excel tanpa menggantikan yang sudah ada
    file_name = 'hasil_analisis.xlsx';
    
    if exist(file_name, 'file')
        % Baca data yang sudah ada dari Excel
        existing_data = xlsread(file_name);
        
        % Tambahkan data baru ke data yang sudah ada
        new_data = [Contrast(1), Contrast(2), Contrast(3), Contrast(4), mean(Contrast), red_mean;
            Correlation(1), Correlation(2), Correlation(3), Correlation(4), mean(Correlation), red_mean;
            Energy(1), Energy(2), Energy(3), Energy(4), mean(Energy), red_mean;
            Homogeneity(1), Homogeneity(2), Homogeneity(3), Homogeneity(4), mean(Homogeneity), red_mean];
        
        data = [existing_data; new_data];
    else
        % Jika file Excel belum ada, buat data baru
        data = [Contrast(1), Contrast(2), Contrast(3), Contrast(4), mean(Contrast), red_mean;
            Correlation(1), Correlation(2), Correlation(3), Correlation(4), mean(Correlation), red_mean;
            Energy(1), Energy(2), Energy(3), Energy(4), mean(Energy), red_mean;
            Homogeneity(1), Homogeneity(2), Homogeneity(3), Homogeneity(4), mean(Homogeneity), red_mean];
    end
    
    % Simpan data ke dalam file Excel
    xlswrite(file_name, data, 'Sheet1', 'A1');
    
    % Menampilkan pesan sukses
    msgbox('Hasil analisis telah disimpan di hasil_analisis.xlsx', 'Sukses', 'help');
    set(handles.uitable3, 'Data', data(end-3:end, :), 'ForegroundColor', [0 0 0])
    
else
    % Tampilkan pesan kesalahan jika belum ada gambar yang dipilih
    msgbox('Pilih gambar terlebih dahulu.', 'Error', 'error');
end

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all hidden;
awal

% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all hidden;
klasifikasi


% --- Executes during object creation, after setting all properties.
function background_CreateFcn(hObject, eventdata, handles)
% hObject    handle to background (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate background
imshow('D:\pengolahan citra\GUI\Gui\bg\tampilan1.jpg');