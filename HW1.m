
function varargout = HW1(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HW1_OpeningFcn, ...
                   'gui_OutputFcn',  @HW1_OutputFcn, ...
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


% --- Executes just before HW1 is made visible.
function HW1_OpeningFcn(hObject, eventdata, handles, varargin)


% Choose default command line output for HW1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = HW1_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
folder_name = uigetdir;
folderDr=folder_name
handles.folderDr=folderDr;
guidata(hObject,handles);
imagefiles = dir(strcat(folder_name,'\*.jpg'));
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   currentimage = imread(strcat(folder_name,'\',currentfilename));
   images{ii} = currentimage;
   Imgname{ii} = imagefiles(ii).name;
end
figure('Name','Training Images','NumberTitle','off')
for k = 1:nfiles
    subplot(3,5,k);
    imshow(images{k});title(Imgname{k});
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' });
      imgDr=strcat(pathname,filename);
      handles.imgDr=imgDr;
guidata(hObject,handles);
figure('Name','Query Image','NumberTitle','off')
imshow(strcat(pathname,filename));title(filename);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)

%calculate Query Image property
folder = handles.folderDr;
imgDr=handles.imgDr;
DissimilarityCalculation(folder,imgDr);



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton3.
function pushbutton3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
