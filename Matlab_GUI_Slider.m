function varargout = Matlab_GUI_Slider(varargin)
% Matlab_GUI_Slider MATLAB code for Matlab_GUI_Slider.fig
%      Matlab_GUI_Slider, by itself, creates a new Matlab_GUI_Slider or raises the existing
%      singleton*.
%
%      H = Matlab_GUI_Slider returns the handle to a new Matlab_GUI_Slider or the handle to
%      the existing singleton*.
%
%      Matlab_GUI_Slider('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Matlab_GUI_Slider.M with the given input arguments.
%
%      Matlab_GUI_Slider('Property','Value',...) creates a new Matlab_GUI_Slider or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Matlab_GUI_Slider_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Matlab_GUI_Slider_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Matlab_GUI_Slider

% Last Modified by GUIDE v2.5 18-Jun-2018 23:52:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Matlab_GUI_Slider_OpeningFcn, ...
                   'gui_OutputFcn',  @Matlab_GUI_Slider_OutputFcn, ...
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


% --- Executes just before Matlab_GUI_Slider is made visible.
function Matlab_GUI_Slider_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Matlab_GUI_Slider (see VARARGIN)

% Choose default command line output for Matlab_GUI_Slider
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Matlab_GUI_Slider wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Matlab_GUI_Slider_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnFilePath1.
function btnFilePath1_Callback(hObject, eventdata, handles)
% hObject    handle to btnFilePath1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename1,filepath1] = uigetfile({'*.jpg';'*.bmp';'*.png'},'Search image1');

fullname1 = [filepath1 filename1];

set(handles.textFilePath1,'string',fullname1);

imagefile1 = imread(fullname1);

handles.imagefile1 = imagefile1;

guidata(hObject,handles);

%axes(handles.Figure);

imagesc(imagefile1);

axis off;

axis image;

set(handles.sliderBlend, 'Value',0);



% --- Executes on slider movement.
function sliderBlend_Callback(hObject, eventdata, handles)
% hObject    handle to sliderBlend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

value = get(hObject,'Value');

if size(handles.imagefile1) == size(handles.imagefile2)
    imageBlend = handles.imagefile1*(1-value) + handles.imagefile2*value; 
    imshow(imageBlend);
    axis off;
else
    global h1 h2;
    h1 = subplot(121);imshow(handles.imagefile1);
    a = size(handles.imagefile1);
    title(['size : ',num2str(a(1)),' x ',num2str(a(2))]);

    
    h2 = subplot(122);imshow(handles.imagefile2);
    b = size(handles.imagefile2);
    title(['size : ',num2str(b(1)),' x ',num2str(b(2))])
    
    axis off;

end 

% --- Executes during object creation, after setting all properties.
function sliderBlend_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderBlend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function textFilePath1_Callback(hObject, eventdata, handles)
% hObject    handle to textFilePath1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textFilePath1 as text
%        str2double(get(hObject,'String')) returns contents of textFilePath1 as a double


% --- Executes during object creation, after setting all properties.
function textFilePath1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textFilePath1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnFilePath2.
function btnFilePath2_Callback(hObject, eventdata, handles)
% hObject    handle to btnFilePath2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename2,filepath2] = uigetfile({'*.jpg';'*.bmp';'*.png'},'Search image2');

fullname2 = [filepath2 filename2];

set(handles.textFilePath2,'string',fullname2);

imagefile2 = imread(fullname2);

handles.imagefile2 = imagefile2;
    
guidata(hObject,handles);





function textFilePath2_Callback(hObject, eventdata, handles)
% hObject    handle to textFilePath2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textFilePath2 as text
%        str2double(get(hObject,'String')) returns contents of textFilePath2 as a double


% --- Executes during object creation, after setting all properties.
function textFilePath2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textFilePath2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h1 h2;
h=0;
cla
if ishandle(h1)   
    delete(h1); h=1;
end
if ishandle(h2)  
    delete(h2); h=1;
end
if h
    delete(h1)  
end

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hint: get(hObject,'Value') returns toggle state of checkbox1
