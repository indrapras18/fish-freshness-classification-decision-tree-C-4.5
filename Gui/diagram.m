function varargout = diagram(varargin)
% DIAGRAM MATLAB code for diagram.fig
%      DIAGRAM, by itself, creates a new DIAGRAM or raises the existing
%      singleton*.
%
%      H = DIAGRAM returns the handle to a new DIAGRAM or the handle to
%      the existing singleton*.
%
%      DIAGRAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIAGRAM.M with the given input arguments.
%
%      DIAGRAM('Property','Value',...) creates a new DIAGRAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before diagram_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to diagram_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help diagram

% Last Modified by GUIDE v2.5 27-Nov-2023 01:53:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @diagram_OpeningFcn, ...
                   'gui_OutputFcn',  @diagram_OutputFcn, ...
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


% --- Executes just before diagram is made visible.
function diagram_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to diagram (see VARARGIN)

% Choose default command line output for diagram
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes diagram wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = diagram_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    data = readtable('kecil.xlsx');  % Ganti 'nama_file.xlsx' dengan nama file Excel Anda

    % Dapatkan kolom prediksi dan label sebenarnya
    predictedLabels = data.Kelas; 
    trueLabels = data.Kelas; 

    % Membuat confusion matrix
    confusionMat = confusionmat(trueLabels, predictedLabels);

    % Menampilkan confusion matrix menggunakan axes pada GUI
    axes(handles.axes2);
    confusionchart(confusionMat, 'RowSummary', 'row-normalized', 'ColumnSummary', 'column-normalized');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Nama file Excel
filename = 'scatter.xlsx';

sheet = 'Sheet1'; 

data = xlsread(filename, sheet);

% Scatter Plot
scatter3(handles.axes4, data(:, 1), data(:, 2), data(:, 3), 50, data(:, 5), 'filled');
xlabel(handles.axes4, 'Contrast 45');
ylabel(handles.axes4, 'Correlation 90');
zlabel(handles.axes4, 'Energy 135');
title(handles.axes4, 'Scatter Plot');
colormap(handles.axes4, jet);

% Menambahkan warna bar pada samping
colorbar(handles.axes4, 'Ticks', unique(data(:, 5)), 'TickLabels', cellstr(num2str(unique(data(:, 5)))));


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all hidden;
awal


% --- Executes during object creation, after setting all properties.
function diagram_CreateFcn(hObject, eventdata, handles)
% hObject    handle to diagram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate diagram
imshow('D:\pengolahan citra\GUI\Gui\bg\diagram.jpeg');