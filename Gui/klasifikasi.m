function varargout = klasifikasi(varargin)
% KLASIFIKASI MATLAB code for klasifikasi.fig
%      KLASIFIKASI, by itself, creates a new KLASIFIKASI or raises the existing
%      singleton*.
%
%      H = KLASIFIKASI returns the handle to a new KLASIFIKASI or the handle to
%      the existing singleton*.
%
%      KLASIFIKASI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KLASIFIKASI.M with the given input arguments.
%
%      KLASIFIKASI('Property','Value',...) creates a new KLASIFIKASI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before klasifikasi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to klasifikasi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help klasifikasi

% Last Modified by GUIDE v2.5 26-Nov-2023 22:27:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @klasifikasi_OpeningFcn, ...
                   'gui_OutputFcn',  @klasifikasi_OutputFcn, ...
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


% --- Executes just before klasifikasi is made visible.
function klasifikasi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to klasifikasi (see VARARGIN)

% Choose default command line output for klasifikasi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes klasifikasi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = klasifikasi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
imshow('F:\KULIAH\Semester 5\Kelompok\bg\klasifikasi.jpg');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile({'*.*'});
 
if ~isequal(filename,0)
    Info = imfinfo(fullfile(pathname,filename));
    if Info.BitDepth == 1
        msgbox('Citra masukan harus citra RGB atau Grayscale');
        return
    elseif Info.BitDepth == 8
        Img = imread(fullfile(pathname,filename));
        axes(handles.axes1)
        cla('reset')
        imshow(Img)
        title('Grayscale Image')
    else
        Img = rgb2gray(imread(fullfile(pathname,filename)));
        axes(handles.axes7)
        cla('reset')
        imshow(Img)
        title('Grayscale Image')
    end
else
    return
end
 
handles.Img = Img;
guidata(hObject,handles);


function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles, 'Img')
    % Ambil gambar dari variabel handles
    img = handles.Img;
    
    % Hitung warna RGB pada gambar
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
    
    % Rata-rata nilai merah
    red_mean = mean(red_channel(:));
    
    % Menampilkan histogram kanal merah
    red_hist = imhist(red_channel);
    
    % Menyimpan histogram dalam variabel handles untuk digunakan nanti
    handles.red_hist = red_hist;
    guidata(hObject, handles);
    
    % Menampilkan hasil analisis di uitable3
    data = [
        Contrast(1), Contrast(2), Contrast(3), Contrast(4), mean(Contrast), red_mean;
        Correlation(1), Correlation(2), Correlation(3), Correlation(4), mean(Correlation), red_mean;
        Energy(1), Energy(2), Energy(3), Energy(4), mean(Energy), red_mean;
        Homogeneity(1), Homogeneity(2), Homogeneity(3), Homogeneity(4), mean(Homogeneity), red_mean
    ];

    set(handles.uitable1, 'Data', data, 'ForegroundColor', [0 0 0]);
    
else
    % Tampilkan pesan kesalahan jika belum ada gambar yang dipilih
    msgbox('Pilih gambar terlebih dahulu.', 'Error', 'error');
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 % Membaca data dari file Excel
    data = readtable('kecil.xlsx');

    % Pisahkan fitur (X) dan label kelas (Y)
    X = data(:, 1:5); % Pilih kolom 1 sampai 4 sebagai fitur
    Y = data(:, 6);   % Pilih kolom 5 sebagai label kelas

    % Membangun model Decision Tree C4.5
    tree = fitctree(X, Y);

    % Mengambil citra dari handles
    Img = handles.Img;

    % Menampilkan gambar pada axes7
    axes(handles.axes7);
    imshow(Img);
    title('Gambar yang Diinput');

    % Menghitung nilai rata-rata piksel
    mean_pixel_value = mean(Img(:));

    % Menghitung statistik GLCM
    pixel_dist = 1;
    GLCM = graycomatrix(Img,'Offset',[0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
    stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});

    % Bentuk data baru untuk prediksi
    new_data = [mean(stats.Contrast), mean(stats.Correlation), mean(stats.Energy), mean(stats.Homogeneity), mean_pixel_value];

    % Melakukan prediksi untuk data baru
    predicted_class = predict(tree, new_data);

    % Menampilkan hasil prediksi
    set(handles.edit4, 'String', char(predicted_class));

    % Menampilkan grafik pohon ke axes8
    view(tree, 'Mode', 'graph');

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all hidden;
awal


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all hidden;
diagram


% --- Executes during object creation, after setting all properties.
function axes10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes10
imshow('D:\pengolahan citra\GUI\Gui\bg\klasifikasi1.jpg');
