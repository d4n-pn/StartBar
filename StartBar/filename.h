#ifndef FILENAME_H
#define FILENAME_H

#include <QObject>

class FileName : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int count READ count WRITE setCount NOTIFY countChanged)
    Q_PROPERTY(bool isDir READ isDir WRITE setIsDir NOTIFY isDirChanged)
    Q_PROPERTY(bool hasChild READ hasChild WRITE setHasChild NOTIFY hasChildChanged)
    Q_PROPERTY(QString filename READ filename WRITE setFilename NOTIFY filenameChanged)
    Q_PROPERTY(QList<QObject*> listSubDir READ listSubDir WRITE setListSubDir NOTIFY listSubDirChanged)
private:
    QList<QObject*> m_listSubDir;
    QString m_filename;

    bool m_isDir;

    bool m_hasChild;

    int m_count;

public:
    FileName();
    ~FileName();
    const QString &filename() const;
    void setFilename(const QString &newFilename);
    void setListSubDir(const QList<QObject *> &newListSubDir);
    const QList<QObject *> &listSubDir() const;
    void addSubDir(QObject *subDir);
    bool isDir() const;
    void setIsDir(bool newIsDir);
    bool hasChild() const;
    void setHasChild(bool newHasChild);

    int count() const;
    void setCount(int newCount);

signals:
    void filenameChanged();
    void listSubDirChanged();
    void isDirChanged();
    void hasChildChanged();
    void countChanged();
};

#endif // FILENAME_H
