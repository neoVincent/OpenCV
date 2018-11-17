#include <QCoreApplication>
#include <opencv2/opencv.hpp>
#include <QDebug>
#include <QFile>
#include <vector>
#include <QResource>

using namespace cv;
using namespace std;

int main(int argc, char *argv[])
{

    QFile file(":/photo2");
    Mat img;
    if (file.open(QIODevice::ReadOnly))
    {
        qint64 sz = file.size();
        vector<uchar> buf(sz);
        file.read((char*)buf.data(),sz);
         //-1 read the file as it is
        img = imdecode(buf,-1);
    }
    else
    {
        qWarning()<<"Image is empty or not found"<<endl;
        return -1;
    }

    namedWindow("Photo1",WINDOW_AUTOSIZE);
    imshow("Photo1",img);
    waitKey(0);
    destroyWindow("Photo1");
    return 0;
}
